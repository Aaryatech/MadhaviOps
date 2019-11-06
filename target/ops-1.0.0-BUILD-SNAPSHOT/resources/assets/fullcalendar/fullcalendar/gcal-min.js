/*!
 * FullCalendar v1.6.4 Google Calendar Plugin
 * Docs & License: http://arshaw.com/fullcalendar/
 * (c) 2013 Adam Shaw
 */
(function(f){var d=f.fullCalendar;var c=d.formatDate;var g=d.parseISO8601;var a=d.addDays;var b=d.applyAll;d.sourceNormalizers.push(function(h){if(h.dataType=="gcal"||h.dataType===undefined&&(h.url||"").match(/^(http|https):\/\/www.google.com\/calendar\/feeds\//)){h.dataType="gcal";if(h.editable===undefined){h.editable=false}}});d.sourceFetchers.push(function(i,j,h){if(i.dataType=="gcal"){return e(i,j,h)}});function e(i,m,h){var k=i.success;var j=f.extend({},i.data||{},{"start-min":c(m,"u"),"start-max":c(h,"u"),singleevents:true,"max-results":9999});var l=i.currentTimezone;if(l){j.ctz=l=l.replace(" ","_")}return f.extend({},i,{url:i.url.replace(/\/basic$/,"/full")+"?alt=json-in-script&callback=?",dataType:"jsonp",data:j,startParam:false,endParam:false,success:function(q){var p=[];if(q.feed.entry){f.each(q.feed.entry,function(u,v){var s=v["gd$when"][0]["startTime"];var x=g(s,true);var r=g(v["gd$when"][0]["endTime"],true);var w=s.indexOf("T")==-1;var t;f.each(v.link,function(y,z){if(z.type=="text/html"){t=z.href;if(l){t+=(t.indexOf("?")==-1?"?":"&")+"ctz="+l}}});if(w){a(r,-1)}p.push({id:v["gCal$uid"]["value"],title:v.title["$t"],url:t,start:x,end:r,allDay:w,location:v["gd$where"][0]["valueString"],description:v.content["$t"]})})}var n=[p].concat(Array.prototype.slice.call(arguments,1));var o=b(k,this,n);if(f.isArray(o)){return o}return p}})}d.gcalFeed=function(i,h){return f.extend({},h,{url:i,dataType:"gcal"})}})(jQuery);