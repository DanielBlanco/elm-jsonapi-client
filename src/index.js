import 'font-awesome/fonts/fontawesome-webfont.woff2';
import 'font-awesome/fonts/FontAwesome.otf';
import 'font-awesome/fonts/fontawesome-webfont.ttf';
import 'font-awesome/fonts/fontawesome-webfont.woff';
import 'font-awesome/fonts/fontawesome-webfont.svg';
import 'font-awesome/fonts/fontawesome-webfont.eot';
import 'font-awesome/css/font-awesome.css';

import 'bulma/css/bulma.css';
import './main.css';
import imgLogo from '../public/logo.svg';
import { Main } from './Main.elm';


const elmDiv = document.getElementById('root');

if (elmDiv) {
  const flags = {
    imgLogo: imgLogo
  };
  Main.embed(elmDiv, flags);
} 
