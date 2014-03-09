function sendGoogleAnalyticsEvents(){
  if(ga){
    console.log("sending pageview...");
    ga('send', 'pageview');
  }  
}