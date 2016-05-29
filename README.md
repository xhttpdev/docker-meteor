# docker-meteor #

Docker Image with Meteor

## Example configuration ##

`docker-compose.yml`

    app:
        image: xhttpdev/docker-meteor:latest
        ports:
            - "3000:3000"
        environment:
            - MONGO_URL=mongodb://example.com:27017/mycollection
        
