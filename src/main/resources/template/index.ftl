<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>cstool for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="./dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-1light">
        <a class="navbar-brand" href="#">CSTOOL</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        me
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-light rounded">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
            <ul class="navbar-nav">
                <#list categorys as category>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="${category.id}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${category.name}</a>
                    </li>
                </#list>



            </ul>
        </div>
    </nav>
    <main role="main">
        <div class="jumbotron">
            <h1 class="display-3">cstool</h1>
            <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>
        <table class="table table-bordered table-striped table-responsive" id="table" style="display: none;">
            <thead>
            <tr>
                <th style="width: 100px;">Name</th>
                <th style="width: 50px;">Type</th>
                <th style="width: 50px;">Default</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
        <div class="row marketing" hidden>
            <div class="col-lg-6">
                <h4>Subheading</h4>
                <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>
                <h4>Subheading</h4>
                <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>
                <h4>Subheading</h4>
                <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
            </div>
            <div class="col-lg-6">
                <h4>Subheading</h4>
                <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>
                <h4>Subheading</h4>
                <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>
                <h4>Subheading</h4>
                <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
            </div>
        </div>
    </main>
    <footer class="footer">
        <p>© Company 2017</p>
    </footer>
</div>
<!-- Bootstrap core JavaScript
  ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="./assets/js/vendor/popper.min.js"></script>
<script src="./dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    // 封装ajax
    var apps = {
        ajax: function(url, type, param, callback) {
            $.ajax({
                url: url,
                type: type,
                dataType: 'json',
                data: param
            })
                    .done(function(data) {
                        callback(data)
                    })
                    .fail(function() {
                        console.log("error");
                    })
                    .always(function(data) {
                        console.log("complete");
                    });
        }
    }

    $(function() {

        $('.navbar-nav a').on('click', function() {
            var dropdown = $(this).parent().find('.dropdown-menu')
            if (dropdown.height() > 400) {
                dropdown.addClass('scrollBar')
            } else {
                dropdown.removeClass('scrollBar')
            }
        })

        var html = ['<tr>',
            '<td>parent</td>',
            '<td>jQuery</td>',
            '<td>false</td>',
            '<td>If parent is provided, then all collapsible elements under the specified parent will be closed when this collapsible item is shown.</td>',
            '</tr>'
        ]

        var $table = $("#table")

        // 回车搜索
        $('input').keydown(function(e) {

            if (e.keyCode == 13) {
                if ($table.css('display') == 'none') {
                    $table.show()
                }
                $("#tbody").append(html)
                return false
            }

        })

        // 点击搜索
        $('button').on('click', function() {
            var val = $('input').val()
            var param = { kd: val }
            // 调用ajax
            apps.ajax('http://192.168.31.237:8080/api/v1/resources/bykd', 'post', param, function(data) {
                console.log(data)
                alert('返回结果==>' + JSON.stringify(data))
                if (data.code == 200) {
                    // 成功处理
                } else {
                    // 错误处理
                }
            })
            return false
        })

    });
</script>
</body>

</html>