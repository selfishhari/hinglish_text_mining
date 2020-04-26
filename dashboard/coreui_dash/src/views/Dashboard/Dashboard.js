import React, { Component, lazy, Suspense } from 'react';
import { Bar, Line } from 'react-chartjs-2';
import {
  Badge,
  Button,
  ButtonDropdown,
  ButtonGroup,
  ButtonToolbar,
  Card,
  CardBody,
  CardFooter,
  CardHeader,
  CardTitle,
  Col,
  Dropdown,
  DropdownItem,
  DropdownMenu,
  DropdownToggle,
  Progress,
  Row,
  Table,
} from 'reactstrap';

import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '@material-ui/lab/Autocomplete';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Divider from '@material-ui/core/Divider';

import {  AppBreadcrumb2 as AppBreadcrumb} from '@coreui/react';
import { CustomTooltips } from '@coreui/coreui-plugin-chartjs-custom-tooltips';
import { getStyle, hexToRgba } from '@coreui/coreui/dist/js/coreui-utilities'

const Widget03 = lazy(() => import('../../views/Widgets/Widget03'));

const TelCharts = lazy(() => import('../../views/Charts/telegram_charts'));

const TimeSeries = lazy(() => import('../../views/Charts/timeseries'));




const brandPrimary = getStyle('--primary')
const brandSuccess = getStyle('--success')
const brandInfo = getStyle('--info')
const brandWarning = getStyle('--warning')
const brandDanger = getStyle('--danger')


const top100Films = [
  { title: 'The Shawshank Redemption', year: 1994 },
  { title: 'The Godfather', year: 1972 },
  { title: 'The Godfather: Part II', year: 1974 },
  { title: 'The Dark Knight', year: 2008 },
  { title: '12 Angry Men', year: 1957 },
  { title: "Schindler's List", year: 1993 },
  ];

class Dashboard extends Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.onRadioBtnClick = this.onRadioBtnClick.bind(this);

    this.state = {
      dropdownOpen: false,
      radioSelected: 2,
    };
  }

  toggle() {
    this.setState({
      dropdownOpen: !this.state.dropdownOpen,
    });
  }

  onRadioBtnClick(radioSelected) {
    this.setState({
      radioSelected: radioSelected,
    });
  }

  loading = () => <div className="animated fadeIn pt-1 text-center">Loading...</div>

  render() {

    return (
      <div className="animated fadeIn">
      
      <Row>

		      <Toolbar align="center" color="#1976d2">
		        <Typography variant="h6" align="center" color="#1976d2">Issue Analysis at Aggregate Level</Typography>
		      </Toolbar>
 

      </Row>

        <Row>
        
		      <Col xs="12" sm="6" lg="6">
		        					<TelCharts id="bmi"/>
		      </Col>
		      
		      <Col xs="12" sm="6" lg="6">
		        					<TelCharts id="ibm"/>
		      </Col>
        
        </Row>
        
        <Row>
				   <Toolbar>
				      <Typography variant="h6">Issue Trend Analysis at Weekly Level</Typography>
				    </Toolbar>
		    </Row>
		    
		    <Row>
		    	<Col xs="12" sm="12" lg="12">
		        					<TimeSeries id="timeseries1"/>
		      </Col>
        
        </Row>
        	
        	
        
        
      </div>
    );
  }
}

export default Dashboard;
