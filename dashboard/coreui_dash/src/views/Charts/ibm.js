import React, { Component } from 'react';
import { Bar, Doughnut, Line, Pie, Polar, Radar } from 'react-chartjs-2';
import { Card, CardBody, CardColumns, CardHeader, Alert,Row, Col } from 'reactstrap';
import { CustomTooltips } from '@coreui/coreui-plugin-chartjs-custom-tooltips';
import Autocomplete from '@material-ui/lab/Autocomplete';
import TextField from '@material-ui/core/TextField';

const chart_options = {
  tooltips: {
    enabled: false
  },
  maintainAspectRatio: false
}


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
												
												onChange={(e,v) =>this.props.onChange(this.props.id, e, v)}
											/>

	)

}

}

//----------------------------------------------------------------------------------------------------------------------//

 var chart_data_options = {
    	"labels":[],
			 "datasets": [
				  {
				     "backgroundColor": "rgba(255,99,132,0.2)",
				     "borderColor": "rgba(255,99,132,1)",
				     "borderWidth": 1,
				     "hoverBackgroundColor": "rgba(255,99,132,0.4)",
				     "hoverBorderColor": "rgba(255,99,132,1)",
				     "label":"default",
				     "data":[]
				     
				  }
			 ]
}

var default_chart_selections = {
  	"level1":"brand",
  	"level1_val":"samsung",
  	"level2":"models",
  	"level2_val":"all",
  	"level3":"issues",
  	"clip_max_labels":15
  	}
  
var requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(default_chart_selections)
};

class IBM extends Component {

constructor(props) {

		super(props);
		
    console.log(chart_data_options);

    this.state = {
      error: null,
      isLoaded: false,
			chart_data_options:chart_data_options,
			l1_options:["fero","vivo","realme","oppo","honor","mi","samsung"],
			issues:[],
			l2_options:{"samsung":["j6","a50","a10","a20","u3","a30","j200g","prime", "all"]},
			tools:[],
			l1_val:default_chart_selections["level1_val"],
			l2_val:default_chart_selections["level2_val"],
    };
    
   this.handleDDChange = this.handleDDChange.bind(this)
   //end of constructor     
}




handleDDChange = (level, event, values) => {


	console.log("************** Bandalo bandalo kanchana ******************", level, values, event);
	
	var l1_val = this.state.l1_val;
	
	var l2_val = this.state.l2_val;

	if(level == "level1"){
	
		l1_val = values
    
    l2_val = this.state.l2_options[l1_val][0]
	
		this.setState({
            l1_val: l1_val,
            l2_val: l2_val
    });
    
	}
	
	if(level == "level2"){
	
		l2_val = values
	
		this.setState({
            l2_val: l2_val,
    });
    
	  console.log(this.state, values);
	
	}
	

	
          
  var chart_selections = {
  	"level1":"brand",
  	"level1_val":l1_val,
  	"level2":"models",
  	"level2_val":l2_val,
  	"level3":"issues",
  	"clip_max_labels":15
  }
  
  var requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(chart_selections)
	};
    
	fetch("http://192.168.0.103:5000/aggregates", requestOptions)
      .then(res => res.json())
      .then(
        (result) => {
        
					chart_data_options["labels"] = result["labels"];
      		
					chart_data_options["datasets"][0]["data"] = result["data"];
					
					chart_data_options["datasets"][0]["label"] = default_chart_selections["level3"]
					
					this.setState({
            isLoaded: true,
            chart_data_options: chart_data_options
          });					
      
	      },
        (error) => {
        
        	console.log("error in fetching chart init data")
        
          this.setState({
            isLoaded: true,
            error
          });
          
        }
    );
      
}
  

  componentDidMount() {
  
  		fetch("http://192.168.0.103:5000/aggregates", requestOptions)
      .then(res => res.json())
      .then(
        (result) => {
        
					chart_data_options["labels"] = result["labels"];
      		
					chart_data_options["datasets"][0]["data"] = result["data"];
					
					chart_data_options["datasets"][0]["label"] = default_chart_selections["level3"]
					
					this.setState({
            isLoaded: true,
            chart_data_options: chart_data_options
          });
          
          console.log("from cdm agg",this.state);
      
	      },
        (error) => {
        
        	console.log("error in fetching chart init data")
        
          this.setState({
            isLoaded: true,
            error
          });
          
        }
    );
    
    fetch("http://192.168.0.103:5000/labels")
      .then(res => res.json())
      .then(
        (result) => {
        
					this.setState({					
            l1_options: result["brand"],
            issues: result["issues"],
            l2_options: result["models"],
            tools: result["tools"]
          });
          
         console.log("from cdm labels",this.state);
					
      
	      },
        (error) => {
        
        	console.log("error in fetching labels data")
        
          this.setState({
            isLoaded: true,
            error
          });
          
        }
    );
  
  console.log("###################################### COmponent load ibm real");
  }
  
     
  render() {
    return (
	 <div className="animated fadeIn">
          <Card>
          
            <CardHeader>
            
		          <Row>
		          
		          	<Col xs="6" sm="6" lg="6">
									<ChartsDropDown
												selected_value={this.state.l1_val}
												id="level1"
												options_list={this.state.l1_options}
												label="Brands"	
												onChange={this.handleDDChange}
											/>
								</Col>
								
		          	<Col xs="6" sm="6" lg="6">
									<ChartsDropDown
												selected_value={this.state.l2_val}
												id="level2"
												options_list={this.state.l2_options[this.state.l1_val]}
												label="Models"
												onChange={this.handleDDChange}
											/>
								</Col>
							
							</Row>
							
							{/*
	            <div className="card-header-actions">
	              <a href="http://www.chartjs.org" className="card-header-action">
	                <small className="text-muted">docs</small>
	              </a>
	            </div>
	            */}
		            
            </CardHeader>
            
            <CardBody>
            
              <div className="chart-wrapper">
									<Bar id="ibm" data={this.state.chart_data_options} options={chart_options} />
              </div>
              
            </CardBody>
          </Card>

      </div>
      );
      }
      }
      
export {IBM};
