var React = require('react');

var Notes = React.createClass({
	render: function() {
		return(
			<div>
				<p> Notes </p>
				<p> hello {this.props.notes} </p>
			</div>
		)
	}
});
module.exports = Notes;