import dash 
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output 
import plotly.express as px
import pandas as pd 

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

##df = pd.read_csv("./data/full.csv")
df = pd.read_csv("./data/monthly.csv")

order = ['January', 'February', "March",'April', 'May', 'June', 'July', 'August']
 
color_map = dict(zip([i for i in df["theme"].unique()],px.colors.qualitative.Plotly[:9]))

theme_names = df['theme'].unique()

app.layout = html.Div(children=[
		html.H1(children='Youtube Viz'),
		html.Div(children='''
			Use the slider below to see monthly trends.
			'''),
		html.H6("Monthly Theme Counts"),

		dcc.Graph(id='graph_with_slider'),
		dcc.Slider(
			id='month-slider',
			min=df['published_month'].min(),
			max=df['published_month'].max(),
			marks=dict(zip([i for i in range(1,10)],order)),
			step=None,
			value=1
			),
		html.Div(
			children='''
			''', style = {'padding':50}),
		dcc.Dropdown(id='dropdown',
			options=[{'label':i, 'value':i} for i in theme_names],
			value= theme_names[0],
			style={'width':'70%'}
			),
		dcc.Graph(id='graph_with_dropdown')

])

@app.callback(
		Output('graph_with_dropdown', 'figure'),
		[Input('dropdown', 'value')])
def update_dropdown(selected_theme):
	filtered_df = df.copy()
	filtered_df = filtered_df[filtered_df['theme']==selected_theme]

	fig = px.bar(filtered_df, x='published_month', y='count',
			color='theme',
			color_discrete_map= color_map)
	
	fig.update_yaxes(range=[0,35])

	fig.update_layout(#title=go.layout.Title("Number of videos per month"),
			transition_duration=500)
	return fig 

@app.callback(
		Output('graph_with_slider', 'figure'),
		[Input('month-slider', 'value')])
def update_figure(selected_month): 

	filtered_df = df[df['published_month']==selected_month]

	fig = px.bar(filtered_df,x="theme", y="count", 
			color="theme",
			color_discrete_map=color_map,
			#color_discrete_sequence=px.colors.qualitative.T10,
			#yaxis=dict(range=[0, 35]),
			labels= {"count":"Count"})
	
	fig.update_yaxes(range=[0,35])

	fig.update_layout(#title=go.layout.Title("Number of videos per month"),
			transition_duration=500)

	return fig


if __name__ == '__main__':
	app.run_server(debug=True)
