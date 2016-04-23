   * docker run -it --rm -p 50095:50095 -p 8088:8088 -p 50070:50070 -p 19888:19888 -h leader --name leader accumulo:0
   * docker run -it --rm -h follower1 --entrypoint /scripts/follower.sh --link leader accumulo:0
   * docker inspect ecstatic_wescoff | jq '.[0].NetworkSettings.IPAddress'
