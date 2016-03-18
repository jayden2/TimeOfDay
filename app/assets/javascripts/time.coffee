$(document).ready ->
    hour = parseInt($("#hour").text())
    minute = parseInt($("#minute").text())
    second = parseInt($("#second").text())
    new Clipboard('.value')

    setTime = ->
        if second > 59
            second = 0
            ++minute
        if minute > 59
            minute = 0
            ++hour
        if hour > 24
            hour = 0
        lenSec = second.toString().length
        lenMin = minute.toString().length
        lenHour = hour.toString().length
        s = second
        m = minute
        h = hour
        if lenSec == 1
            s = "0" + second
        if lenMin == 1
            m = "0" + minute
        if lenHour == 1
            h = "0" + hour
        $('#second').text(s)
        $('#minute').text(m)
        $('#hour').text(h)
        updateHex(h, m, s)

    updateHex = (h, m, s) ->
        hex = "##{h}#{m}#{s}"
        $("html").css({ "background-color": "#{hex}", "transition": "2.5s ease-in" })
        $("h2").text(hex)

    setInterval (->
        ++second
        setTime()
    ), 1000


    $('#hexy').click ->
        hexy = $(this).find("h2").text()
        $("<li><a class='value' href='#' data-clipboard-text='#{hexy}'><span>&#32;&#32;#{hexy}</span> <img src='assets/clippy.svg' alt='Copy to clipboard'></a></li>")
            .prependTo("#values")
            .hide().slideDown("slow")
        $("li span").css({ "background-color": "#{hexy}" })
        $("li:nth-child(8)").fadeOut(2000)
