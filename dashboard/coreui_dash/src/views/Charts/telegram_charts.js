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
												
													onChange={(e,v) =>this.props.onChange(this.props.id, e, v)}
												/>

		)

	}

}

//----------------------------------------------------------------------------------------------------------------------//



class TelCharts extends Component {

constructor(props) {

		super(props);
		
    //console.log("telcharts constructor", this.props);
    
    var brands = ["fero","vivo","realme","oppo","honor","mi","samsung"];
    
    var models = {"samsung":["j6","a50","a10","a20","u3","a30","j200g","prime", "all"],
    							"mi":['mi 6','6a', 'note 5', 'mi 5', '5 pro', 'note 7', '5a', 'all']};
    
    var issues = ["flash", "frp", "unlock"]
    
    var l2_label = "models"
    
    var l1_label = "brand"
    
    if (this.props.id=="bmi"){
    
    var l1_options = brands
    var l2_options = models[this.default_chart_selections["level1_val"]] 
    var l2_label = "models" 
    var l1_label = "brand"
    var l1_val = "mi"
    var l2_val= "all"
    this.chart_title = "Prominent issues in a Device"

    
    }else{
    
    var l1_options = issues
    var l2_options = brands
    var l2_label = "brand" 
    var l1_label = "issues"
    var l1_val = "flash"
    var l2_val = "all"
    this.chart_title = "Prominent devices with the Issue"
    
    
    }

   this.handleDDChange = this.handleDDChange.bind(this)
   
   
   
   this.state = {
      error: null,
      isLoaded: false,
			chart_data_options:this.chart_data_options,
			l1_options:l1_options,
			issues:issues,
			l2_options:l2_options,
			tools:[],
			l1_val:l1_val,
			l2_val:l2_val,
			l2_label:l2_label,
			l1_label:l1_label
    };
    
    this.chart_options = {
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
                align: 'top'
            }
},
title: {
            display: true,
            text: this.chart_title
        }
}
    
   //end of constructor     
}



chart_wrapper_style = {position: "relative", height:"50vh", width:"43vw"}

chart_data_options = {
    	"labels":[],
			 "datasets": [
				  {
				     "backgroundColor": "#69be48",
				     "borderColor": "#4dbd74",
				     "borderWidth": 1,
				     "hoverBackgroundColor": "#a6b1e1",
				     "hoverBorderColor": "#424874",
				     "label":"% Issues",
				     "data":[] 
				     
				  }
			 ]
};

default_chart_selections = {
  	"level1":"brand",
  	"level1_val":"mi",
  	"level2":"models",
  	"level2_val":"all",
  	"level3":"issues",
  	"clip_max_labels":15
};
  
requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(this.default_chart_selections)
};




handleDDChange = (level, event, values) => {


	//console.log("************** Bandalo bandalo kanchana ******************", level, values, event);
	
	console.log(this.state.chart_data_options)
	
	var l1_val = this.state.l1_val;
	
	var l2_val = this.state.l2_val;
	
	var l2_options = this.state.l2_options;
	
	var level3 = ""
	


	if(level == "level1"){
	
		l1_val = values
		
			if (this.props.id == "bmi"){
			
			    l2_val = this.state.models[l1_val][0]
			    level3 = "issues"
			    l2_options = this.state.models[l1_val]
			    
			}else{
			    l2_val = l2_val
			    level3 = "models"
			}
    

	
		this.setState({
            l1_val: l1_val,
            l2_val: l2_val,
            l2_options:l2_options
    });
    
	}
	
	if(level == "level2"){
	
		l2_val = values
		
	
		this.setState({
            l2_val: l2_val,
    });
    
   
    
	  //console.log(this.state, values);
	
	}
	
	if (this.props.id == "ibm"){
    if (l2_val=="all"){
    
	    level3 = "brand"
    
    }else{
    
	    level3 = "models"
    
    }
    }else{
    level3="issues"
    
    }
	

	
  if (this.props.id == "bmi"){
  var chart_selections = {
  	"level1":"brand",
  	"level1_val":l1_val,
  	"level2":"models",
  	"level2_val":l2_val,
  	"level3":level3,
  	"clip_max_labels":15
  }
  }else{
  var chart_selections = {
  	"level1":"issues",
  	"level1_val":l1_val,
  	"level2":"brand",
  	"level2_val":l2_val,
  	"level3":level3,
  	"clip_max_labels":15
  }
  
  
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
        
					this.chart_data_options["labels"] = result["labels"];
      		
					this.chart_data_options["datasets"][0]["data"] = result["data"];
					

					
					console.log(chart_selections, this.chart_data_options, this.props.id)
					
					this.setState({
            isLoaded: true,
            chart_data_options: this.chart_data_options
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
  
  		if (this.props.id == "ibm"){
  		
  		var chart_selections = {
				"level1":"issues",
				"level1_val":"flash",
				"level2":"brand",
				"level2_val":"all",
				"level3":"brand",
				"clip_max_labels":15
			};
			
			}else{
  		chart_selections = this.default_chart_selections
  		
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
        
					this.chart_data_options["labels"] = result["labels"];
      		
					this.chart_data_options["datasets"][0]["data"] = result["data"];
					
					
					//console.log("debig ", this.props.id, this.props)
					if (this.props.id=="ibm"){
			//console.log("debug debug", requestOptions, this.chart_data_options, result)
			}
					
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
    
    fetch("http://192.168.0.103:5000/labels")
      .then(res => res.json())
      .then(
        (result) => {
        
        //console.log("************ Labels****", result)
        
        result = JSON.parse(JSON.stringify(result))
        
        var l1_options_res = []
        var issues_res = []
        var l2_options_res = []
        var tools_res = []
        var models_res = []
        var brand_res = []
        
        	if (this.props.id=="ibm"){
        			l1_options_res = result["issues"]
		          issues_res = result["issues"]
		          l2_options_res = result["brand"]
		          tools_res = result["tools"]
		          models_res = result["models"]
		          brand_res = result["brand"]
		      	
        	
        	}else{
				
		          l1_options_res = result["brand"]
		          issues_res = result["issues"]
		          l2_options_res = result["models"][chart_selections["level1_val"]]
		          tools_res = result["tools"]
		          models_res =result["models"]
		          brand_res = result["brand"]

        	
        	}
        	
        	//console.log(this.state);
        	//console.log("mystery fuckl",this.props.id, result["models"],(JSON.parse(JSON.stringify({l2_options_res}))), typeof(l2_options_res));
        	
        	this.setState({					
		          l1_options: l1_options_res,
		          issues: issues_res,
		          l2_options: l2_options_res,
		          tools: tools_res,
		          models: models_res,
		          brand: brand_res
	        });
        
					
          
         //console.log("from cdm labels",this.state);
					
      
	      },
        (error) => {
        
        	console.log("error in fetching labels data")
        
          this.setState({
            isLoaded: true,
            error
          });
          
        }
    );
  console.log("###################################### COmponent load ibm");

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
												label={this.state.l1_label}	
												onChange={this.handleDDChange}
											/>
								</Col>
								
		          	<Col xs="6" sm="6" lg="6">
									<ChartsDropDown
												selected_value={this.state.l2_val}
												id="level2"
												options_list={this.state.l2_options}
												label={this.state.l2_label}	
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
            
              <div className="chart-wrapper" style={this.chart_wrapper_style}>
									<Bar id="ddd" data={this.state.chart_data_options} options={this.chart_options} />
              </div>
              
            </CardBody>
          </Card>

      </div>
      );
      }
      }
      
export default TelCharts;
