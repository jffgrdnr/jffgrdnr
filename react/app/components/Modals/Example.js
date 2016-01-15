var React = require('react');
var Example = React.createClass({
    componentDidMount: function() {
        // var $checkboxContainer = $(this.refs.checkboxContainer);
        // console.log($checkboxContainer);
        // var $checkbox = $('<input />').prop('type', 'checkbox');
        function cloneWithProps(c) {
            // Coming in next version of React!
            var newInstance = new c.constructor();
            newInstance.construct(c.props);
            return newInstance;
          }
        // $checkboxContainer.append($checkbox);
        $('#autocompleteExample1').autocomplete({
            'source': 'http://placepfx.ancestry.com/s/?callback=?&maxCount=6&cultureId=en',
            'key': 'HName',
            'queryParameter': 'prefix'
        });
        this.getChildren().forEach(function(child, i) {
         React.renderComponent(cloneWithProps(child), node);
         }.bind(this));
    },
    render: function() {
        return (
            <div>
                <div ref="checkboxContainer">
                    <form action="#" className="form" encType="multipart/form-data" method="post">
                    <div className="ancGrid">
                        <div className="ancCol w100">
                            <label htmlFor="autocompleteExample1" className="slide">test</label>
                            <input id="autocompleteExample1" type="text" name="firstNameMale" className="personFirstName" placeholder="{{#localize}}FIRST_NAME{{/localize}}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}FIRST_NAME{{/localize}}'"/>
                        </div>
                        <div className="ancColRow">
                            <div className="ancCol ancColRow w50 topSpacing">
                                <label htmlFor="lastNameRoot" className="slide">test</label>
                                <input id="lastNameRoot" type="text" name="lastNameMale" className="personLastNamePaternal" placeholder="{{#localize}}LAST_NAME{{/localize}} {{#localize}}PATERNAL{{/localize}}"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}LAST_NAME{{/localize}} {{#localize}}PATERNAL{{/localize}}'" />
                            </div>
                            <div className="ancCol w50 topSpacing">
                                <label htmlFor="lastNameRoot" className="slide">test</label>
                                <input id="lastNameRoot" type="text" name="lastNameMale" className="personLastNameMaternal" placeholder="{{#localize}}LAST_NAME{{/localize}} {{#localize}}MATERNAL{{/localize}}"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}LAST_NAME{{/localize}} {{#localize}}MATERNAL{{/localize}}'" />
                            </div>
                        </div>
                        <div className="ancCol ancColRow w100">
                            <label htmlFor="birthDateAgeRoot" className="slide">test</label>
                            <input id="birthDateAgeRoot" type="text" name="birthDateAgeMale" className="personBirthDate" placeholder="{{#localize}}BIRTH_DATE_AGE{{/localize}}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}BIRTH_DATE_AGE{{/localize}}'" />
                        </div>
                        <div className="ancCol ancColRow w100">
                            <label htmlFor="birthCityStateRoot" className="slide">test</label>
                            <input id="birthCityStateRoot" type="text" name="birthCityStateMale" className="personBirthLoc" placeholder="{{#localize}}BIRTH_CITY_STATE{{/localize}}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}BIRTH_CITY_STATE{{/localize}}'" />
                        </div>
                        <div className="ancCol ancColRow w100 showDead">
                            <label htmlFor="deathDateAgeRoot" className="slide">test</label>
                            <input id="deathDateAgeRoot" type="text" name="deathDateAgeMale" className="personDeathDate" placeholder="{{#localize}}DEATH_DATE_AGE{{/localize}}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}DEATH_DATE_AGE{{/localize}}'" />
                        </div>
                        <div className="ancCol ancColRow w100 showDead">
                            <label htmlFor="deathCityStateRoot" className="slide">test</label>
                            <input id="deathCityStateRoot" type="text" name="deathCityStateMale" className="personDeathLoc" placeholder="{{#localize}}DEATH_CITY_STATE{{/localize}}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '{{#localize}}DEATH_CITY_STATE{{/localize}}'" />
                        </div>
                        <div className="ancCol ancColRow w100">
                            <input id="livingDeadRoot" type="checkbox" className="checkbox livingDead" />
                            <label htmlFor="livingDeadRoot">test</label>
                        </div>
                    </div>
                    <button type="submit" className="ancBtn lrg green savePersonAdd" >test</button>
                </form>
                </div>
            </div>
        )
    }
});

module.exports = Example;