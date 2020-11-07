<%-- 
    Document   : admin
    Created on : 25 Feb, 2019, 2:20:54 AM
    Author     : winayak
--%>

<%@page import="hibernate.Buses_pojo"%>
<%@page import="hibernate.Students_pojo"%>
<%@page import="hibernate.Staff_pojo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="hibernate.App" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Admin Page</title>
        <style>
            body{
                background-color: #969696!important;
            }
            .jumbotron,#sidebar,main{
                opacity: 0;
            }
            .pac-container{
                z-index: 9999999;
            }
            .routes4,.time4{
                display: none;
            }
            #spinner{
                position: absolute;
                left: 50%;
                top: 50%;
                color: #fff;
                font-size: 40px;
                transform: translate(-50%,-50%);
            }
        </style>
        <script>
            $(document).ready(function(){
                $("body>div").animate({opacity:1},1000);
                $("body>main").animate({opacity:1},1000);
            });
            $(document).ready(function(){       
                var scroll = $("#main1").offset().top;
                $(".delete").click(function(){
                    $(this).parent().remove();
                });
                $("#staff").click(function(){
                    console.log(scroll);
                   $("#main1").show(); 
                   $("#main2").hide();
                   $("#main3").hide();
                   $("html").animate({scrollTop: scroll},800);
                });
                $("#students").click(function(){
                   console.log(scroll);
                   $("#main2").show(); 
                   $("#main1").hide();
                   $("#main3").hide();
                   $("html").animate({scrollTop: scroll},800);
                });
                $("#buses").click(function(){
                   console.log(scroll);
                   $("#main3").show(); 
                   $("#main1").hide();
                   $("#main2").hide();
                   $("html").animate({scrollTop: scroll},800);
                });
                $("#search1>div").on("click",function(){
                    $("html").animate({scrollTop: scroll},800);
                    var search = $("#search_inp").val();
                    var option = $("#option").val();
                    console.log(search);
                    console.log(option);
                    if(search != ""){
                        if(option == "staff"){ 
                            $("#main1").show(); 
                            $("#main2").hide();
                            $("#main3").hide();
                            $("#main1 .table tbody tr").each(function(){
                                var str = $(this).children("td").first().text();
                                str  = str.trim(/\s/g, '');
                                if(str == search){
                                    $(this).show();
                                }
                                else{
                                    $(this).hide();
                                }
                            });
                        }
                        else if(option == "bus"){
                            $("#main1").hide(); 
                            $("#main2").hide();
                            $("#main3").show();
                            $("#main3 .table tbody tr").each(function(){
                                var str = $(this).children("td").first().text();
                                str  = str.trim(/\s/g, '');
                                if(str == search){
                                    $(this).show();                                    
                                }                                
                                else{
                                    $(this).hide();
                                }
                            });
                        }
                        else if(option == "student"){                            
                            $("#main1").hide(); 
                            $("#main2").show();
                            $("#main3").hide();
                            $("#main2 .table tbody tr").each(function(){
                                var str = $(this).children("td").first().text();
                                str  = str.trim(/\s/g, '');
                                if(str == search){
                                    $(this).show();
                                }
                                else{
                                    $(this).hide();
                                }
                            });
                        }
                        else if(option == "route"){                            
                            $("#main1").hide(); 
                            $("#main2").hide();
                            $("#main3").show();
                            var route = "";
                            $("#main3 tbody tr").css("display","none");
                            $("#main3 tbody tr").each(function(){
                                route = $(this).children("td").eq(1).html();
                                console.log(route);
                                route = route.replace(/[/.]/g, " ");
                                console.log(route);
                                route = route.split(/[\s]/);
                                console.log(route);
                                for(var i=0;i<route.length;i++){
                                    if(route[i] == search){
                                        $(this).show();
                                        console.log("yo");
                                        break;
                                    }
                                }
                            });
                            
                        }
                    }
                });

                $("#staff").click(function(){
                    $("#main1 .table tr").show();
                });
                $("#students").click(function(){
                    $("#main2 .table tr").show();
                });
                $("#buses").click(function(){
                    $("#main3 .table tr").show();
                });
                $(".stat").click(function(){
                    if($(this).html() == "on"){
                        $(this).html("cancelled");
                    }
                    else{
                        $(this).html("on");
                    }
                });
            });
            $(document).ready(function(){
                $("#submit1").click(function(){
                    $("body>div").animate({opacity:0},400);
                    $("body>main").animate({opacity:0},400);
                    var name = $("#name1").val().toLowerCase();
                    var email = $("#email1").val().toLowerCase();
                    var contact = $("#contact1").val();
                    var job_desc = $("#job_desc1").val().toLowerCase();
                    var password = Math.random().toString(36).substr(2,5);
                    console.log(name+email+contact+job_desc+password);
                    $.ajax({
                        type:"post",
                        url:"Add_staff",
                        data: {name:name,email:email,contact:contact,job_desc:job_desc,password:password},
                        success: function(res){
                            alert(res);
                        },
                        error: function(res){
                            console.log(res);
                            alert("Error!!");
                        }
                    });  
                });
                 $("#submit2").click(function(){
//                    $("body>div").animate({opacity:0},400);
//                    $("body>main").animate({opacity:0},400);
                    var name = $("#name2").val().toLowerCase();
                    var email = $("#email2").val().toLowerCase();
                    var contact = $("#contact2").val();
                    var bus_stop = $("#busstop2").val().toLowerCase();
                    var id = $("#id2").val();
                    var bus_no = $("#busno2").val();
                    var arr_time = $("#time2").val();
                    var password = Math.random().toString(36).substr(2, 5);

                    $.ajax({
                        type:"post",
                        url:"Add_students",
                        data: {name:name,email:email,contact:contact,bus_stop:bus_stop,password:password,arr_time:arr_time,bus_no:bus_no,id:id},
                        success: function(res){
                            alert(res);
                        },
                        error: function(res){
                            console.log(res);
                            alert("Error!!");
                        }
                    });  
                });
                 $("#submit3").click(function(){
                    var bus_no = $("#busno3").val();
                    var status = $("#status3").val();;
                    var routes = "";
                    var time = [];
                    $(".routes4").each(function(){
                        if(routes == ""){
                            routes = $(this).val().toLowerCase();
                        }
                        else{
                            routes = routes+"."+$(this).val().toLowerCase();   
                        }
                    });
                    if(routes == ""){
                        routes= $(".routes3").val().toLowerCase();
                    }
                    else{
                        routes= routes +"."+ $(".routes3").val().toLowerCase();
                    }
                    console.log(routes);
                    $(".time4").each(function(){
                        time.push($(this).val());
                    });
                    time.push($(".time3").val());
                    time = time.toString();
                    console.log(bus_no,status,time,routes);
                    $.ajax({
                        type:"post",
                        url:"add_buses",
                        data: {routes:routes,bus_no:bus_no,status:status,time:time},
                        success: function(res){
                            alert(res);
                        },
                        error: function(res){
                            alert(res);
                        }
                    });  

                });
                $("#route_inp i").on("click",function(){
                   var route =  $(".routes3").val();
                   $(".routes3").val("");
                   var time =  $(".time3").val();
                   $(".time3").val("");
                   $("#route_inp").append("<input type=\"text\" class=\"form-control routes4\" value=\""+route+"\">"); 
                   $("#time_inp").append("<input type=\"time\" class=\"form-control time4\" value=\""+time+"\">"); 
                });
            });            
        </script>
    </head>
    <body>
        <span id="spinner"><i class="fas fa-circle-notch fa-spin"></i></span>
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Add Staff</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                      <form action="#">
                        <div class="form-group">
                          <label for="name1">Name</label>
                          <input type="text" class="form-control" id="name1">
                        </div>
                        <div class="form-group">
                          <label for="name1">Email</label>
                          <input type="email" class="form-control" id="email1">
                        </div>
                        <div class="form-group">
                          <label for="contact1">Contact</label>
                          <input type="number" class="form-control" id="contact1">
                        </div>
                        <div class="form-group">
                          <label for="job_desc">Job Description</label>
                          <input type="text" class="form-control" id="job_desc1">
                        </div>
                      </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="submit1">Submit</button>
                  </div>

                </div>
            </div>
        </div>
        <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Add Students</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                      <form action="#">
                        <div class="form-group">
                          <label for="name2">Name</label>
                          <input type="text" class="form-control" id="name2">
                        </div>
                        <div class="form-group">
                          <label for="name2">Id</label>
                          <input type="number" class="form-control" id="id2">
                        </div>
                        <div class="form-group">
                          <label for="name2">Contact</label>
                          <input type="number" class="form-control" id="contact2">
                        </div>
                        <div class="form-group">
                          <label for="busno2">Email</label>
                          <input type="email" class="form-control" id="email2">
                        </div>
                        <div class="form-group">
                          <label for="busno2">Bus No</label>
                          <input type="number" class="form-control" id="busno2">
                        </div>
                        <div class="form-group">
                          <label for="stop1">Bus Stop</label>
                          <input type="text" class="form-control" id="busstop2">
                        </div>
                        <div class="form-group">
                          <label for="time1">Arrival Time</label>
                          <input type="time" class="form-control" id="time2">
                        </div>
                      </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="submit2">Submit</button>
                  </div>

                </div>
            </div>
        </div>
        <div class="modal" id="myModal3">
            <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Add Bus</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                      <form action="#">
                        <div class="form-group">
                          <label for="busno3">Bus No</label>
                          <input type="number" class="form-control" id="busno3">
                        </div>
                          <div class="form-group" id="route_inp">
                          <label for="routes3">Route&nbsp;<i class="fas fa-plus"></i></label>
                          <input type="text" class="form-control routes3" id="suggest">
                        </div>
                        <div class="form-group" id="time_inp">
                          <label for="time3">Time</label>
                          <input type="time" class="form-control time3">
                        </div>
                        <div class="form-group">
                            <label for="status3">Status</label>
                            <select class="form-control" id="status3">
                              <option value="on">On</option>
                              <option value="cancelled">Cancelled</option>
                            </select>
                        </div>
                      </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="submit3">Submit</button>
                  </div>

                </div>
            </div>
        </div>
        <div class="jumbotron text-center">
            <div id="left">
                <h1><img src="https://hp.chitkara.edu.in/Interface/Dashboard/cu_logo.png"></h1>
                <p>Bus Management</p>
            </div>
            <div id="right">
                <span><i class="fas fa-user"></i></span><span>Admin</span>
            </div>
        </div>
        <div id="sidebar" class="col-12 col-md-3 col-lg-2">
            <div>
                <h3>Sidebar</h3>
                <div>
                    <a href="#" >Home</a>
<!--                    <a href="#" >Recent Updates</a>-->
                    <a href="#" >Profile</a>
                </div>
            </div>
        </div>
        <main class="col-12 col-md-9 col-lg-10">
            
            <div id="search" class="col-12 col-md-8">
                <div>
                    <h3>Search&nbsp;&nbsp;|</h3>
                    
                    <div class="input-group mb-3" id="search1">
                        <input type="text" class="form-control" placeholder="search" id="search_inp">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <select class="form-control" id="option">
                          <option value="student">Student</option>
                          <option value="staff">Staff</option>
                          <option value="bus">Bus</option>
                          <option value="route">Route</option>
                        </select>
                    </div>
                </div>
            </div>
 
            <div id="profile" class="col-12 col-md-4">
                <div>
                    <img src="data:image/png;base64,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">
                    <br>
                    <p>Admin</p>
                </div>
            </div>                        
            
            <div id= "data" class="col-12 col-md-8">
                <div>
                    <div id="staff">
                        <i class='fas fa-user-tie' style='font-size:48px'></i>
                        <p><a>Staff<a</p>
                    </div>
                    <div id="students">
                        <i class='fas fa-user' style='font-size:48px'></i>
                        <p>Student</p>
                    </div>
                    <div id="buses">
                        <i class='fas fa-bus' style='font-size:48px'></i>
                        <p>Buses</p>
                    </div>
                </div>                
            </div>

            <div id="map" class="col-12 col-md-8">
<!--                <div>
                    <h3>Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</h3>
                    
                    <div class="input-group mb-3" id="search1">
                        <input type="text" class="form-control" placeholder="search">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <select class="form-control" id="option">
                          <option value="student">Student</option>
                          <option value="staff">Staff</option>
                          <option value="bus">Bus</option>
                          <option value="route">Route</option>
                        </select>
                    </div>
                </div>-->
<!--                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3424.3342014269365!2d76.8700623153352!3d30.877310585700855!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ff55d9e0ed113%3A0x34a6cadf9a13d341!2sChitkara+University!5e0!3m2!1sen!2sin!4v1554316484602!5m2!1sen!2sin" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>-->
                <div></div>
            </div>
            
            <div id="alert" class="col-12 col-md-4">
                <div>
                    <h3>Alerts<span>0</span></h3>
                    <hr>
                    <p>qweqwebkbq wqehwq qwehiwq wqe qwe qwe qwe qw eqw e wq e qw<span>00:00:00</span></p>
                    
                </div>
            </div>
            
            <div id="main1" class="col-12 col-md-12">
                <div>
                    <h3>Staff&nbsp;<span data-toggle="modal" data-target="#myModal"><i class="fas fa-plus"></i></span></h3>
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Job Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% 
                                App obj = new App();
                                List l = obj.fetch_staff();
                                Staff_pojo obj2 = new Staff_pojo();
                                Iterator i = l.iterator();
                                while(i.hasNext()){
                                    obj2 = (Staff_pojo) i.next();
                            %>
                          <tr>
                              <td><%out.println(obj2.getname());%></td>
                            <td><%out.println(obj2.getemail());%></td>
                            <td><%out.println(obj2.getcontact());%></td>
                            <td><%out.println(obj2.getjob_desc());%></td>
                            <td><span><i class="fas fa-pencil-alt"></i></span></td>
                            <td class="delete"><span><i class="fas fa-trash"></i></span></td>
                          </tr>   
                          <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="main2" class="col-12 col-md-12">
                <div>
                    <h3>Students&nbsp;<span data-toggle="modal" data-target="#myModal2"><i class="fas fa-plus"></i></span></h3>
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Bus no</th>
                            <th>Bus Stop</th>
                            <th>Contact</th>
                            <th>Arrival Time</th>
                            <th>Edit</th>
                            <th>Delete</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% 
                                List l2 = obj.fetch_student();
                                Students_pojo obj3 = new Students_pojo();
                                Iterator i2 = l2.iterator();
                                while(i2.hasNext()){
                                    obj3 = (Students_pojo) i2.next();
                            %>
                          <tr>
                            <td><%out.println(obj3.getname());%></td>
                            <td><%out.println(obj3.getemail());%></td>
                            <td><%out.println(obj3.getbus_no());%></td>
                            <td><%out.println(obj3.getbus_stop());%></td>
                            <td><%out.println(obj3.getcontact());%></td>
                            <td><%out.println(obj3.time());%></td>
                            <td><span><i class="fas fa-pencil-alt"></i></span></td>
                            <td class="delete"><span><i class="fas fa-trash"></i></span></td>
                          </tr>   
                          <%}%>
                        </tbody>
                      </table>
                </div>
            </div>
            <div id="main3" class="col-12 col-md-12">
                <div>
                    <h3>Buses&nbsp;<span data-toggle="modal" data-target="#myModal3"><i class="fas fa-plus"></i></span></h3>
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Bus no</th>
                            <th>Routes</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% 
                                List l3 = obj.fetch_buses();
                                Buses_pojo obj4 = new Buses_pojo();
                                Iterator i3 = l3.iterator();
                                while(i3.hasNext()){
                                    obj4 = (Buses_pojo) i3.next();
                            %>
                          <tr>
                            <td><%out.println(obj4.getbus_no());%></td>
                            <td><%out.println(obj4.getroutes());%></td>
                            <td><%out.println(obj4.gettime());%></td>
                            <td class="stat"><%out.println(obj4.getstatus());%></td>
                            <td><span><i class="fas fa-pencil-alt"></i></span></td>
                            <td class="delete"><span><i class="fas fa-trash"></i></span></td>
                          </tr>
                          <%}%>
                        </tbody>
                      </table>
                </div>
            </div>
        </main>
        
        <footer>
            <div>
                <span class="fa-stack fa-lg">
                  <i class="fas fa-mail-bulk fa-stack-1x"></i>
                </span>
                <span class="fa-stack fa-lg">
                  <!-- <a href="#"> --><i class="fab fa-instagram fa-stack-1x"></i><!-- </a> -->
                </span>
                <span class="fa-stack fa-lg">
                  <i class="fab fa-facebook-f fa-stack-1x"></i>
                </span>
            </div>
            <br>
            <div>
                <p>Chitkara © 2019. All Rights Reserved.</p>
                <p>Designed & Developed By hiwinayak</p>
            </div>
        </footer>  
    </body>    
    <script>
        var map;
        var marker;
        var lcn;
        var tm;
        var i = 0;
        function initMap(){
            var location = {lat:30.8773106,lng:76.8724};
            map = new google.maps.Map(document.querySelector("#map>div"),{zoom:16,center:location});
            marker = new google.maps.Marker({
                position: location,
                map: map,
            });                   
            var input = document.querySelector("#suggest");
            
            var autocomplete = new google.maps.places.Autocomplete(input);
            
            autocomplete.setComponentRestrictions({'country': 'IN'});
                        
            var geocoder = new google.maps.Geocoder();
            
            $(".table tbody tr").click(function(){
                lcn = $(this).children("td").eq(1).html();
                lcn = lcn.split(".");
                tm = $(this).children("td").eq(2).html();
                tm = tm.split(",");
                for(i=0;i<lcn.length;i++){
                    var title = tm[i]+"\n"+lcn[i];
                    geocodeAddress(geocoder,map,title);
                }
                function geocodeAddress(geocoder, resultsMap,title) {
                    console.log(title);
                    geocoder.geocode({'address': lcn[i]}, function(results, status) {
                        addmarker(results,title);
                    });
                }
                function addmarker(results,qw){
                    marker = new google.maps.Marker({
                        position: results[0].geometry.location,
                        map: map,
                        title: qw
                    });                   
                }
                map.setZoom(10);
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFMOJVM7yyhd13D6lookuMKVqDzzBqgko&region=IN&libraries=places&callback=initMap"></script>
</html>
