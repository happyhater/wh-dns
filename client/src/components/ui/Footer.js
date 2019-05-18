import React, { Component } from 'react';
import { Trans, withNamespaces } from 'react-i18next';
import { REPOSITORY, LANGUAGES, PRIVACY_POLICY_LINK } from '../../helpers/constants';
import i18n from '../../i18n';

import './Footer.css';
import './Select.css';

class Footer extends Component {
    getYear = () => {
        const today = new Date();
        return today.getFullYear();
    };

    changeLanguage = (event) => {
        i18n.changeLanguage(event.target.value);
    }

    render() {
        return (
            <footer className="footer">
                <div className="container">
                    <div className="footer__row">
                        <div className="footer__column">
                            <div className="footer__copyright">
                                <Trans>copyright</Trans> &copy; {this.getYear()} WhiteHat
                            </div>
                        </div>
                        <div className="footer__column">
                            <a href="mailto:zmeu@whitehat.ro" className="btn btn-outline-primary btn-sm footer__link footer__link--report" target="_blank" rel="noopener noreferrer">
                                <Trans>report_an_issue</Trans>
                            </a>
                        </div>
                        <div className="footer__column footer__column--language">
                            <select className="form-control select select--language" value={i18n.language} onChange={this.changeLanguage}>
                                {LANGUAGES.map(language =>
                                    <option key={language.key} value={language.key}>
                                        {language.name}
                                    </option>)}
                            </select>
                        </div>
                    </div>
                </div>
            </footer>
        );
    }
}

export default withNamespaces()(Footer);
