var React = require('react');
var ReactDOMServer = require('react-dom/server');
var ModalContents = require('./ModalContents');
var ProfileModal = require('./ProfileModal');
var Example = require('./Example');
var Modal = React.createClass({
	componentDidMount: function() {
		var modalContents = ReactDOMServer.renderToString(<ProfileModal />),
			profileModal = ReactDOMServer.renderToString(<ProfileModal />);
		var modal = <ProfileModal />;
		$('#modalExample1').click(function(){
			$('<div id="modalExampleContents1" className="modal" >' + modalContents + '</div>').modal();
		});
		$('#modalExample2').click(function(){
			$('<div id="modalExampleContents2" className="modal" data-title="Basic Modal Example - HTML">' + profileModal + '</div>').modal();
		});
	},
	render: function() {
		return (
			<div>
				<button className="ancBtn" id="modalExample1" type="button">modal</button>
				<button className="ancBtn" id="modalExample2" type="button">HTML</button>
			</div>
		)
	}
});
module.exports = Modal;