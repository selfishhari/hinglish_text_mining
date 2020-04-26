import React, { Component } from 'react';
import { Bar, Doughnut, Line, Pie, Polar, Radar } from 'react-chartjs-2';
import { Card, CardBody, CardColumns, CardHeader, Alert,Row, Col } from 'reactstrap';
import Autocomplete from '@material-ui/lab/Autocomplete';
import TextField from '@material-ui/core/TextField';
import 'chartjs-plugin-datalabels';

class ChartsDropDown extends Component {

	constructor(props){

			super(props);
	}

	render(){
		return (

		<Autocomplete
													value={this.props.selected_value}
													id={this.props.id}
													options={this.props.options_list}
													getOptionLabel={(option) => option}
													size="small"
													style={{ width: "100%" }}
													renderInput={(params) => <TextField {...params} label={this.props.label} variant="outlined" />}
												

												/>

		)

	}

}

//----------------------------------------------------------------------------------------------------------------------//

class TimeSeries extends Component {

	constructor(props) {

		super(props);
		
		this.state = {
			l1_val:"oppo",
			l1_options:["oppo", "mi", "samsung", "realme", "vivo", "apple"],
			l1_label:"Brand",
			l2_val:"all",
			l2_options:["all","a83","a9","f1s","a7","f3"],
			l2_label:"Models",
			l3_val:"flash",
			l3_options:["flash","unlock","frp"],
			l3_label:"Issues",
			chart_data_options:this.chart_data_options
		}
	//------------------------------- End of Constructor---------------------//
	}
	
	chart_options = {
		tooltips: {
		  enabled: true,

		},
		responsive: true,
		maintainAspectRatio: false,
		scales: {
		      xAxes: [{
		          gridLines: {
		              display:false
		          }
		      }],
		      yAxes: [{
		          gridLines: {
		              display:false
		          },
		          ticks: {
		              display: false
		          }
		  
		      }]
		},
		plugins: {
		          // Change options for ALL labels of THIS CHART
		          datalabels: {
		              color: 'black',
		              anchor:'end',
		              align: 'left'
		          }
	},
	title: {
		          display: true,
		          text: "Weekly Issue Counts"
		      }
	}
	
	chart_wrapper_style = {position: "relative", height:"50vh", width:"90vw"}
	
	chart_data_options = {
    	"labels":[],
			 "datasets": [
				  {
				     "backgroundColor": "#69be48",
				     "borderColor": "#4dbd74",
				     "borderWidth": 1,
				     "hoverBackgroundColor": "#a6b1e1",
				     "hoverBorderColor": "#424874",
				     "label":"Issue Counts",
				     "data":[]
				     
				  }
			 ]
	}
	
  componentDidMount() {
		var chart_selections = {
					"level1":"brand",
					"level1_val":"samsung",
					"level2":"models",
					"level2_val":"all",
					"level3":"issues",
					"level3_val":"unlock",
					"clip_max_labels":15
				};
				
		var requestOptions = {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify(chart_selections)
			};
			
		fetch("http://192.168.0.103:5000/timeseries", requestOptions)
      .then(res => res.json())
      .then(
        (result) => {
        
						this.chart_data_options["labels"] = result["labels"];
		    		
						this.chart_data_options["datasets"][0]["data"] = result["data"];
					
						this.setState({
		          isLoaded: true,
		          chart_data_options: this.chart_data_options
		        });
		        
		        //console.log("from cdm agg",this.state);
		    
			    },
		      (error) => {
		      
		      	console.log("error in fetching chart init data")
		      
		        this.setState({
		          isLoaded: true,
		          error
		        });
          
        }
    );
				
				
				//----------- End of ComponentDidMount------------------//
  }
	
	
	render() {
    return (
	 <div className="animated fadeIn">
          <Card>
          
            <CardHeader>
            
		          <Row>
		          
		          	<Col xs="4" sm="4" lg="4">
									<ChartsDropDown
												selected_value={this.state.l1_val}
												id="level1"
												options_list={this.state.l1_options}
												label={this.state.l1_label}	

											/>
								</Col>
								
		          	<Col xs="4" sm="4" lg="4">
									<ChartsDropDown
												selected_value={this.state.l2_val}
												id="level2"
												options_list={this.state.l2_options}
												label={this.state.l2_label}	

											/>
								</Col>
								
								<Col xs="4" sm="4" lg="4">
									<ChartsDropDown
												selected_value={this.state.l3_val}
												id="level2"
												options_list={this.state.l3_options}
												label={this.state.l3_label}	

											/>
								</Col>
							
							</Row>
							
							
	            <div className="card-header-actions">
	              <a href="http://www.chartjs.org" className="card-header-action">
	                <small className="text-muted">Download Data</small>
	              </a>
	            </div>
	            
		            
            </CardHeader>
            
            <CardBody>
            
              <div className="chart-wrapper" style={this.chart_wrapper_style}>
									<Line id="timeseries" data={this.state.chart_data_options} options={this.chart_options} />
              </div>
              
            </CardBody>
          </Card>

      </div>
      );
  }


}

export default TimeSeries;
