
This html code taken from https://gist.github.com/pitch-gist/2999707

## How to use

Run build docker with ARG

`page_type` - Choose either `backsoon` (for we will back soon message) or `wip` (for underconstruction message).
`from_team` - In the end of message will added long dash & team name `— <from_team>`. Example: `— Fajarhac Technology`

```console
$ docker build --build-arg page_type='wip' --build-arg from_team='ZF Enterprise' -t wip .
```