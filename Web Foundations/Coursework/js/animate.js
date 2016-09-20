// this will make the JavaScript engine much pickier about potential programming issues
'use strict';
// get the "drawing context" - the object that can actually draw on the canvas
var c = document.getElementById("canvas").getContext("2d");
// set our drawing style
c.lineWidth = 3;
c.lineCap = "round";
c.lineJoin = "round"
c.strokeStyle = "#000";
// the stick figure will walk on a horizontal path from x=100 to x=700
var pathStart = 100;
var pathEnd = 700;
// this counts how much we have walked already
var distanceWalked = 0;
// the walking stick man's current position along the path
var position = pathStart;
// are we going along the path (1) or backwards (-1)
var direction = 1;
// how many pixels the stick figure can walk per second
var speed = 50;
// how smooth should the animation be (24 frames per second is Hollywood standard)
var framesPerSecond = 24;
// whether or not we're currently walking
var walking = false;
// draw the scene
drawEverything(c)
startStopWalking();
// update the current state (and re-draw) framesPerSecond times every second (1000 ms)
setInterval(updateCurrentState, 1000/framesPerSecond)
function drawEverything(c) {
  // clear the canvas - we'll redraw everything
  c.clearRect(0,0,800,600)
  // this is our walking stick figure
  drawStickFigure(c, position, 350, (1-direction)*90, distanceWalked);
  // this is a watching stick figure
  drawStickFigure(c, 400, 180, 180*(pathEnd - position)/(pathEnd - pathStart))
}
function updateCurrentState() {
  if (!walking) return;
  // compute how far we have walked since the last time we've been in this function
  var walkedNow = speed * elapsedTime()
  position = position + direction * walkedNow
  // at the end of the path, we turn around
  if (position > pathEnd) {
    direction = -1;
    position = pathEnd - (position - pathEnd)
  }
  // at the beginning of the path, we turn around
  if (position < pathStart) {
    direction = 1;
    position = pathStart + (pathStart - position)
  }
  // update the distance walked so the stride matches
  distanceWalked += walkedNow
  drawEverything(c)
}
function startStopWalking() {
  walking = !walking;
  // reset timer
  elapsedTime();
  // update the text of the button
  byId("startstop").textContent = walking ? "Stop walking" : "Start walking";
  return true;
}
function setSpeed(val) {
  speed = val;
}
// helpful function for finding elements in the document
function byId(id) {
    return document.getElementById(id);
}
