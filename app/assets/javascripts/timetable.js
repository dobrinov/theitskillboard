function Timetable(node){
  var self = this;

  self.node = $(node);

  self.month_height   =  6; // px
  self.left_padding   = 70; // px
  self.activity_space =  5; // px

  self.columns = 0;
  self.activities = new Array(); self.parseActivities();
  self.columns = self.calculateColumns();
  self.setActivityWidth();

  $(window).resize(function(){
    self.setActivityWidth();
  });

  self.from_date = self.calculateFromDate();
  self.to_date = self.calculateToDate();

  // Init
  self.render();
}

Timetable.prototype.render = function(){
  this.renderGrid();
}

Timetable.prototype.renderGrid = function(){
  var to_year = new Date().getFullYear();
  var from_year = this.from_date.getFullYear();

  var timetable_grid = $(document.createElement('ul')).addClass('timetable__grid');

  for(var current_year=to_year; current_year >= from_year; current_year--){
    var timetable_grid_year = $(document.createElement('li'));

    timetable_grid_year.addClass('timetable__grid__year');
    timetable_grid_year.css('height', this.month_height * 12 + 'px');
    timetable_grid_year.css('line-height', this.month_height * 12 + 'px');

    if(current_year == to_year){
      timetable_grid_year.addClass('timetable__grid__year_first');
    }

    if(current_year == from_year){
      timetable_grid_year.addClass('timetable__grid__year_last');
    }

    timetable_grid_year.html(current_year);

    timetable_grid.append(timetable_grid_year);
  }

  this.node.append(timetable_grid);
}

Timetable.prototype.parseActivities = function(){
  var self = this;

  $(self.node).find('.timetable__activity').each(function(){
    self.activities.push(new TimetableActivity($(this), self));
  });
}

Timetable.prototype.calculateFromDate = function(){
  var min_from_date;

  for(var i=0; i<this.activities.length; i++){

    if (!min_from_date || min_from_date > this.activities[i].from_date ){
      min_from_date = this.activities[i].from_date;
    }
  }

  return min_from_date;
}

Timetable.prototype.calculateToDate = function(){
  var max_to_date;

  for(var i=0; i<this.activities.length; i++){
    if (!max_to_date || max_to_date < this.activities[i].to_date ){
      max_to_date = this.activities[i].to_date;
    }
  }

  return max_to_date;
}

Timetable.prototype.calculateColumns = function(){
  var columns = 0;

  for(var i=0; i<this.activities.length; i++){
    if(columns < this.activities[i].column + 1){
      columns = this.activities[i].column + 1;
    }
  }

  return columns;
}

Timetable.prototype.calculateActivityWidth = function(){
  var width = this.node.outerWidth() - this.left_padding - (this.columns - 1) * this.activity_space;
  console.log(width);
  var activity_width = width / this.columns;

  return activity_width;
}

Timetable.prototype.setActivityWidth = function(){
  var width = this.calculateActivityWidth();
  var activities = this.activities;

  for(var i=0; i<activities.length; i++){
    activities[i].node.width = width;
    activities[i].node.css('width', width + 'px');
    activities[i].node.css('left', this.left_padding + activities[i].column * this.activity_space + activities[i].column * width + 'px' );
  }
}


/// Timetable activity

function TimetableActivity(node, timetable){
  this.node = $(node);
  this.timetable = timetable;

  this.at        = this.parseAt();
  this.website   = this.parseWebsite();
  this.from_date = this.parseFrom();
  this.to_date   = this.parseTo();

  this.column = this.calculateColumn();

  this.width = 200;
  this.height = this.calculateHeight();
  this.left;
  this.top;

  this.applyStyle();
}

TimetableActivity.prototype.parseAt = function(){
  return 'TODO';
}

TimetableActivity.prototype.parseWebsite = function(){
  return 'www.todo.com';
}

TimetableActivity.prototype.parseFrom = function(){
  return new Date(this.node.data('from'));
}

TimetableActivity.prototype.parseTo = function(){
  return new Date(this.node.data('to'));
}

TimetableActivity.prototype.calculateColumn = function(){
  var column = 0;
  var activities = this.timetable.activities;

  for(var i=0; i<activities.length; i++){
    if(column == activities[i].column && this.overlaps(activities[i])){
      column++;
    }
  }
  
  return column;
}

TimetableActivity.prototype.calculateHeight = function(){
  return this.months() * this.timetable.month_height;
}

TimetableActivity.prototype.overlaps = function(activity){
  return this.from_date < activity.to_date && this.to_date > activity.from_date;
}

TimetableActivity.prototype.months = function(){
  return milliseconds_to_months(this.to_date - this.from_date);
}

TimetableActivity.prototype.applyStyle = function(){
  this.node.css('height', this.height + 'px');
  // this.node.css('line-height', this.height + 'px');
  this.node.css('top', milliseconds_to_months(Date.UTC(new Date().getFullYear()+1,0,1,-1,-1,-1,-1) - this.to_date) * this.timetable.month_height + 'px');
}

function milliseconds_to_months(milliseconds) {
  return milliseconds / 2628000000;
}