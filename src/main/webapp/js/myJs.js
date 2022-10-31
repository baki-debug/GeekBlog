function doLike(pid, uid) {
    console.log(pid + " , " + uid)
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }
    $.ajax({
        url: 'LikeServlet',
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data)
            if (data.trim() == 'true') {
                let c = $(".like-counter").html()
                c++;
                $(".like-counter").html(" " + c)
                console.log(`if-${pid}`)
                $(".like-btn").removeClass("fa-thumbs-o-up")
                $(".like-btn").addClass("fa-thumbs-up")
            } else {
                let c = $(".like-counter").html()
                c--;
                $(".like-counter").html(" " + c)
                console.log(`else-${pid}`)
                $(".like-btn").removeClass("fa-thumbs-up")
                $(".like-btn").addClass("fa-thumbs-o-up")
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })



}