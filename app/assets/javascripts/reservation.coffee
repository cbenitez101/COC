# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  console.log 'llegaRESERVATION'
  $('#map').hide()
  $('#prest').hide()
  $('#errorreserva').hide()
  $('#alertaseleccionrest').hide()
  if $('#formdate').length > 0
    $.datepicker.regional['es'] =
      closeText: 'Cerrar'
      prevText: '<Ant'
      nextText: 'Sig>'
      currentText: 'Hoy'
      monthNames: [
        'Enero'
        'Febrero'
        'Marzo'
        'Abril'
        'Mayo'
        'Junio'
        'Julio'
        'Agosto'
        'Septiembre'
        'Octubre'
        'Noviembre'
        'Diciembre'
      ]
      monthNamesShort: [
        'Ene'
        'Feb'
        'Mar'
        'Abr'
        'May'
        'Jun'
        'Jul'
        'Ago'
        'Sep'
        'Oct'
        'Nov'
        'Dic'
      ]
      dayNames: [
        'Domingo'
        'Lunes'
        'Martes'
        'Miércoles'
        'Jueves'
        'Viernes'
        'Sábado'
      ]
      dayNamesShort: [
        'Dom'
        'Lun'
        'Mar'
        'Mié'
        'Juv'
        'Vie'
        'Sáb'
      ]
      dayNamesMin: [
        'Do'
        'Lu'
        'Ma'
        'Mi'
        'Ju'
        'Vi'
        'Sá'
      ]
      weekHeader: 'Sm'
      dateFormat: 'dd/mm/yy'
      firstDay: 1
      isRTL: false
      showMonthAfterYear: false
      yearSuffix: ''
    $.datepicker.setDefaults $.datepicker.regional['es']
    $('#formdate').datepicker
      minDate: new Date
      altField: '#actualDate'
  $('select#provincia').on 'change', (event) ->
    $('#localidad option').show()
    $('#localidad option:not(.' + $('#provincia option:selected').attr('class') + ')').hide()
    $('#restnombre option').show()
    $('#restnombre option:not(.' + $('#provincia option:selected').attr('class') + ')').hide()
    return
  $('select#localidad').on 'change', (event) ->
    $('#restnombre option').show()
    console.log $('#localidad option:selected').attr('class').split(' ')[1]
    $('#restnombre option:not(.' + $('#localidad option:selected').attr('class').split(' ')[1] + ')').hide()
    return
  $('#encontrar').on 'click', ->
    $('#alertaseleccionrest').empty()
    $('#alertaseleccionrest').hide()
    if $('#restnombre option:selected').length > 0 and $('#restnombre option:selected').val() != 'Selecciona un restaurante'
      myLatLng = 
        lat: 27.768517
        lng: -15.586641
      map = new (google.maps.Map)(document.getElementById('map'),
        zoom: 16
        zoomControl: true
        mapTypeControl: true
        scaleControl: true
        streetViewControl: true
        rotateControl: true
        scrollwheel: false
        center: myLatLng)
      # var icon = {
      #     url: "http://www.freeiconspng.com/uploads/map-navigation-pin-point-restaurant-icon--14.png", // url
      #     scaledSize: new google.maps.Size(70, 70), // scaled size
      #     origin: new google.maps.Point(0,0), // origin
      #     anchor: new google.maps.Point(0, 0) // anchor
      # };
      marker = new (google.maps.Marker)(
        position: myLatLng
        map: map
        title: $('#restnombre option:selected').html())
      $('#map').fadeIn()
      $('#prest').fadeIn()
      $('#datosrest').empty()
      $('#datosrest').append '<br/><b>Nombre:</b> ' + $('#restnombre option:selected').html() + '<br/>'
      #$('#datosrest').append('<b>Telefono:</b> '+restnombre['telefono']+'<br/>');
      #$('#datosrest').append('<b>Direccion:</b> '+restnombre['direccion']+'<br/>');
      #$('#datosrest').append('<b>Codigo Postal:</b> '+restnombre['CP']+'<br/>');
    else
      $('#alertaseleccionrest').text 'Has de seleccionar al menos un restaurante'
      $('#alertaseleccionrest').fadeIn()
    return
  $('#botonreserva').on 'click', (e) ->
    console.log 'hola'
    vacio = false
    datas = Array()
    $('#errorreserva').fadeOut()
    $('.reserva option:selected').each ->
      if $(this).val() == 'Selecciona un restaurante'
        vacio = true
      else
        datas.push $(this).val()
      return
    $('.reserva input:not(#botonreserva)').each ->
      if $(this).val() == ''
        vacio = true
      else
        datas.push $(this).val()
      return
    datos = {}
    if !vacio
      datos =
        provincia: if datas[0] != 'Selecciona una provincia' then datas[0] else ''
        localidad: if datas[1] != 'Selecciona una localidad' then datas[0] else ''
        restaurante: datas[2]
        comensales: datas[3]
        fecha: datas[4]
        hora: datas[5]
      console.log datos
      $.ajax(
        url: '/reservation/create'
        type: 'POST'
        data: datos).done ->
        vacio = false
        console.log datos
        return
    else
      $('#errorreserva').fadeIn()
    return
  return

# ---
# generated by js2coffee 2.2.0