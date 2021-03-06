var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
      selectable: true,
      selectHelper: true,
      editable: false,
      eventLimit: true,
      events: '/events.json',
      height: 'parent',
      timeFormat: {
        agenda: 'H' //h:mm{ - h:mm}'
    },
      defaultView: 'month',
      businessHours: true,
      businessHours: {
        start: '09:00',
        end: '18:00'
      },

      select: function(start, end) {
        $.getScript('/events/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {});
      }
    });
  })

  $(function() {
    $('#calendar1').fullCalendar({
      defaultView: 'listDay',

      // customize the button names,
      // otherwise they'd all just say "list"

      header: {
        left: 'title',
        center: '',
        right: ''
      },
      events: '/events.json',
      height: 200
    })
  });
};

$(document).on('turbolinks:load', initialize_calendar);
