<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maze</title>
</head>

<link rel="stylesheet" href="style/style.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 다시한번 -->
    <script>
        var x = 0;
        var y = 0;
        var map_text = "";
        
        var map = new Array();

        // 10x10 2차원 배열 만들기
        for (var i = 0; i <= 10; i++) {
            map[i] = new Array();
        }

        // 맵을 초기화
        for (var i = 0; i <= 10; i++) {
            for (var j = 0; j <= 10; j++) {
                map[i][j] = "□";
            }
        }

        $(function() {

            $(document).on("keydown", keyEventFnc);

            // e : 이벤트 객체, 여기서는 키가 눌린 정보를 저장함
            // 2차원 배열에서 좌표를 생각해보면
            // x는 행, y는 열에 해당
            // 밑으로 갈 수록 y 증가
            // 위로 갈 수록 y 감소
            function keyEventFnc(e) {
                var direct = "";

                switch (e.keyCode) {
                    case 37:
                        direct = "LEFT";
                        if (check_x(direct)) {
                            map[y][x] = "□";
                            x--;
                        }
                        break;

                    case 38:
                        direct = "TOP";
                        if (check_y(direct)) {
                            map[y][x] = "□";
                            y--;
                        }
                        break;

                    case 39:
                        direct = "RIGHT";
                        if (check_x(direct)) {
                            map[y][x] = "□";
                            x++;
                        }
                        break;

                    case 40:
                        direct = "BOTTOM";
                        if (check_y(direct)) {
                            map[y][x] = "□";
                            y++;
                        }
                        break;
                }

                if (direct) {
                    $("#user_id").val(direct);
                    document.getElementById("location").innerHTML = ("[현재 좌표]<br>x:" + x + " y:" + y);
                }

                map[y][x] = "■";

                // 이동한 위치에 따라 맵을 그림
                draw();
                
            }

            function draw() {
                map_text = "";

                for (var i = 0; i <= 10; i++) {
                    for (var j = 0; j <= 10; j++) {
                        map_text += map[i][j] + " ";
                    }
                    map_text += "<br>";
                }

                document.getElementById("map").innerHTML = map_text;
            }

            function check_x(direct) {
                if (direct == "LEFT") {
                    if (x - 1 < 0) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
                else if (direct =="RIGHT") {
                    if (x + 1 > 10) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }

            function check_y(direct) {
                if (direct == "TOP") {
                    if (y - 1 < 0) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
                else if (direct =="BOTTOM") {
                    if (y + 1 > 10) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }
        }); // end of  $(function(){});
</script>
 <body>
 	<div id="location"></div>
    <div id="map"></div>
 </body>
</html>