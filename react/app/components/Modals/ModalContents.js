var React = require('react');
var ModalContents = React.createClass({
	componentDidMount: function() {
		console.log(<ModalContents/>);
		$(".clickMe").on("click", function(){
			console.log("sup");
		});
	},
	render: function() {
		return (
			<div>	
				<h2>HEADER</h2>
				<button className="ancBtn clickMe" type="button">hi</button>
				<p>And Stuff</p>
			</div>
		)
	}
});
module.exports = ModalContents;