module Main exposing (main)

import Browser
import Html exposing (Html, button, div, img, text, a)
import Html.Events exposing (onClick)
import Html.Attributes exposing (target, href, src, class, alt)
import List exposing (map, sortBy)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Technology =
    { name : String
    , url : String
    , image : String
    }


myTechnologies : List Technology
myTechnologies =
    [ Technology "Blender" "https://www.blender.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Blender_logo_no_text.svg/1252px-Blender_logo_no_text.svg.png"
    , Technology "Django Rest Framework" "https://www.django-rest-framework.org/" "https://miro.medium.com/max/722/1*MQ-Lf8tmtfa-pumN2Sh0cw.png"
    , Technology "Python" "https://www.python.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1024px-Python-logo-notext.svg.png"
    , Technology "Django" "https://www.djangoproject.com/" "https://cdn.worldvectorlogo.com/logos/django.svg"
    , Technology "Unity" "https://unity.com/" "https://images.techhive.com/images/article/2015/03/unity-logo-100571261-large.jpg"
    , Technology "Java" "https://www.java.com/" "https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/1200px-Java_programming_language_logo.svg.png"
    , Technology "Docker" "https://www.docker.com/" "https://www.docker.com/sites/default/files/social/docker_facebook_share.png"
    , Technology "Linux" "https://www.linux.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/1200px-Tux.svg.png"
    , Technology "Arch Linux" "https://www.archlinux.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Archlinux-icon-crystal-64.svg/1024px-Archlinux-icon-crystal-64.svg.png"
    , Technology "Docker Compose" "https://docs.docker.com/compose/" "https://i0.wp.com/codeblog.dotsandbrackets.com/wp-content/uploads/2016/10/compose-logo.jpg?resize=262%2C285"
    , Technology "Gitlab" "https://about.gitlab.com/" "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/GitLab_Logo.svg/1108px-GitLab_Logo.svg.png"
    , Technology "HTML5" "https://en.wikipedia.org/wiki/HTML5" "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/120px-HTML5_logo_and_wordmark.svg.png"
    , Technology "React" "https://reactjs.org/" "https://cdn.auth0.com/blog/react-js/react.png"
    , Technology "NodeJS" "https://nodejs.org/en/" "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/1200px-Node.js_logo.svg.png"
    , Technology "Vim" "https://www.vim.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/544px-Vimlogo.svg.png"
    , Technology "Redux" "https://redux.js.org/" "https://raw.githubusercontent.com/reduxjs/redux/master/logo/logo.png"
    , Technology "Lua" "https://www.lua.org/" "https://upload.wikimedia.org/wikipedia/commons/6/6a/Lua-logo-nolabel.svg"
    , Technology "Cocos2dx" "https://cocos2d-x.org/" "https://cocos2d-x.org/images/logo.png"   
    , Technology "C++" "http://www.cplusplus.com/" "https://raw.githubusercontent.com/isocpp/logos/master/cpp_logo.png"
    , Technology "C" "https://en.wikipedia.org/wiki/C_(programming_language)" "https://seeklogo.com/images/C/c-programming-language-logo-9B32D017B1-seeklogo.com.png"
    , Technology "OpenGL" "https://www.opengl.org/" "https://www.opengl.org/img/opengl_logo.png" 
    , Technology "Ruby" "https://www.ruby-lang.org/en/" "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1024px-Ruby_logo.svg.png"
    , Technology "Ruby on Rails" "https://rubyonrails.org/" "https://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png"
    , Technology "Groovy" "http://groovy-lang.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Groovy-logo.svg/1200px-Groovy-logo.svg.png"
    , Technology "Grails" "https://grails.org/" "https://objectcomputing.com/files/9414/8725/8350/1_Grails_RGB.png"
    , Technology "Gradle" "https://gradle.org/" "https://gradle.org/images/gradle-256x256.png"
    , Technology "Maven" "https://maven.apache.org/" "https://maven.apache.org/images/maven-logo-black-on-white.png"
    , Technology "Git" "https://git-scm.com/" "https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png"
    , Technology "Redux Saga" "https://redux-saga.js.org/" "https://cdn-images-1.medium.com/max/614/1*zcK3vvoVjsqkqB0oja8RWw.png"
    , Technology "Wordpress" "https://wordpress.com/" "https://s.w.org/style/images/about/WordPress-logotype-simplified.png" 
    , Technology "GraphQL" "https://graphql.org/" "https://graphql.org/img/logo.svg" 
    , Technology "Apollo" "https://www.apollographql.com/" "https://seeklogo.com/images/A/apollo-logo-DC7DD3C444-seeklogo.com.png"
    , Technology "Lambda" "https://aws.amazon.com/lambda/" "https://www.stratoscale.com/wp-content/uploads/AWS-Lambda.png"
    , Technology "AWS" "https://aws.amazon.com/" "https://coinspectator-com.s3.eu-west-2.amazonaws.com/production/982358/5f1fec8ce3a536adf833ebf759a86532.png"
    , Technology "Latex" "https://www.latex-project.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/LaTeX_logo.svg/1280px-LaTeX_logo.svg.png"
    , Technology "PHP" "https://www.php.net/" "https://www.php.net/images/logos/php-logo.svg"
    , Technology "Serverless" "https://serverless.com/" "https://user-images.githubusercontent.com/2752551/30405068-a7733b34-989e-11e7-8f66-7badaf1373ed.png"
    , Technology "Flask" "http://flask.pocoo.org/" "https://cdn.worldvectorlogo.com/logos/flask.svg"
    , Technology "C#" "https://en.wikipedia.org/wiki/C_Sharp_(programming_language)" "https://www.onlinebooksreview.com/uploads/blog_images/2018/01/27_c-sharp-logo-filled.png"
    , Technology "VB.net" "https://en.wikipedia.org/wiki/Visual_Basic_.NET" "https://hackr.io/tutorials/learn-visual-basic-net-vb/logo/logo-visual-basic-net-vb?ver=1551354757"
    , Technology "Jekyll" "https://jekyllrb.com/" "https://jekyllrb.com/img/logo-2x.png" 
    , Technology "Jest" "https://jestjs.io/" "https://g00glen00b.be/wp-content/uploads/2018/07/jest.png"
    , Technology "Semantic-UI" "https://semantic-ui.com/" "https://semantic-ui.com/images/logo.png"
    , Technology "Sass" "https://sass-lang.com/" "https://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg"
    , Technology "Bootstrap" "https://getbootstrap.com/" "https://cdn.worldvectorlogo.com/logos/bootstrap-4.svg"
    , Technology "Emmet" "https://emmet.io/" "https://emmet.io/-/4076541266/i/logo.svg"
    , Technology "CMake" "https://cmake.org/" "https://cmake.org/wp-content/uploads/2018/11/cmake_logo_slider.png"
    , Technology "Boost" "https://www.boost.org/" "https://theboostcpplibraries.com/static/main/img/boost-logo.svg"
    , Technology "Elm" "https://elm-lang.org/" "https://d2eip9sf3oo6c2.cloudfront.net/tags/images/000/000/397/full/elm.png"
    , Technology "Haskell" "https://www.haskell.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Haskell-Logo.svg/1200px-Haskell-Logo.svg.png"
    , Technology "Graphene" "https://graphene-python.org/" "https://avatars0.githubusercontent.com/u/15002022?s=400&v=4"
    , Technology "Rust" "https://www.rust-lang.org/" "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Rust_programming_language_black_logo.svg/1024px-Rust_programming_language_black_logo.svg.png"
    , Technology "JQuery" "https://jquery.com/" "https://i.pinimg.com/originals/c0/26/1a/c0261af0418d8ad72fdd8a7f4379d7db.png"
    , Technology "AppSync" "https://aws.amazon.com/en/appsync/" "https://media.graphcms.com/jN6lJfSgCNnGe6H5QGgS"
    , Technology "Helm" "https://augmentedfifth.github.io/helm/" "https://augmentedfifth.github.io/helm/img/logo.svg"
    , Technology "Love2D" "https://love2d.org" "https://avatars2.githubusercontent.com/u/17165675?s=400&v=4"
    , Technology "Styled components" "https://www.styled-components.com/" "https://www.styled-components.com/static/logo.png"
    , Technology "React Router" "https://reacttraining.com/react-router/" "https://camo.githubusercontent.com/f63754b8412368e820601967af6dea84312b925b/68747470733a2f2f7265616374747261696e696e672e636f6d2f72656163742d726f757465722f616e64726f69642d6368726f6d652d313434783134342e706e67"
    , Technology "SQL Alchemy" "https://www.sqlalchemy.org/" "https://www.sqlalchemy.org/img/sqla_logo.png"
    , Technology "Jinja" "http://jinja.pocoo.org/docs/2.10/" "http://jinja.pocoo.org/docs/2.10/_static/jinja-small.png"
    , Technology "PlantUML" "http://plantuml.com/" "http://plantuml.com/logo3.png"
    , Technology "Tmux" "https://github.com/tmux/tmux" "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Tmux_logo.svg/1280px-Tmux_logo.svg.png"
    , Technology "Click" "https://click.palletsprojects.com/en/7.x/" "https://click.palletsprojects.com/en/7.x/_images/click-logo.png"
    ]


type alias Model = List Technology


init : Model
init = sortBy .name myTechnologies

update : Msg -> Model -> Model
update msg model = model


type Msg
    = Increment
    | Decrement

wrapDiv : Technology -> Html Msg
wrapDiv tech = 
  a [ href tech.url,  target "_black"] [
    img [class "technology", src tech.image, alt tech.name] []
    ]


view : Model -> Html Msg
view model =
    div [] ( map wrapDiv model)
