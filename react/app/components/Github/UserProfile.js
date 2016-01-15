var React = require('react');

var UserProfile = React.createClass({
	render: function() {
		return (
			<div>
				<p> User profile </p>
				<p> {this.props.username} </p>
				<p> {this.props.bio.name} </p>
			</div>
		)
	}
});
module.exports = UserProfile;