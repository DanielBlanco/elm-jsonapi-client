Sample ELM app
==============

Simple ELM app that connects to `https://randomuser.me/api` and shows the
information in a pretty [Bulma](https://bulma.io) template.


## Site Demo:
https://danielblanco.github.io/elm-jsonapi-client/

## Lessons learned

#### Images
Handling images is a bit tricky, in this app I follow two different approaches.

The first one is passing the image through Flags which gives me the ability
to change the image path at will in the `src/index.js` file, which means I can
also have an environment file and pass the value to the JavaScript through
environment variables. So this approach gives me flexibility on the config side.

The problem with this approach is that I need to pass the value to every ELM
module that needs the image path and this is a pain.

The second approach is to use a CDN, and I followed this approach in
`src/Data/Picture.elm` in `toStringUrl` function. This approach does not require
me to pass the path from function to function, but if for whatever reason the
path changes I need to modify the ELM code, and create/deploy a new build.


#### ELM
ELM is a great language, it really helps me reason about my code and build
great and secure products. The only caveat that I see is that ELM is really
verbose.

#### What's next?
I'm going to start learning [ReasonML](https://reasonml.github.io/).
