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
      defaultView: 'agendaWeek',
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
      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' },
        listMonth: { buttonText: 'list month' }
      },

      header: {
        left: 'title',
        center: '',
        right: 'listDay,listWeek,listMonth'
      },
      events: '/events.json',
      height: 200
    })
  });
};

$(document).on('turbolinks:load', initialize_calendar);
