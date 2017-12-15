<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>D3-operation</title>

    <!-- Styles -->

    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
      <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('css/font-awesome.min.css')}}">
      <!-- Ionicons -->
    <link rel="stylesheet" href="{{asset('css/ionicons.min.css')}}">
      <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('css/AdminLTE.min.css')}}">
      <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{{asset('css/skin-blue.min.css')}}">
      <!-- Morris chart -->
    <link rel="stylesheet" href="{{asset('css/morris.css')}}">
      <!-- jvectormap -->
    <link rel="stylesheet" href="{{asset('css/jquery-jvectormap.css')}}">
      <!-- Date Picker -->
    <link rel="stylesheet" href="{{asset('css/bootstrap-datepicker.min.css')}}">
      <!-- Daterange picker -->
    <link rel="stylesheet" href="{{asset('css/daterangepicker.css')}}">
      <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="{{asset('css/bootstrap3-wysihtml5.min.css')}}">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <span class="logo-lg"><b>D3</b>OPERATION</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav navbar-right">
            <!-- Authentication Links -->
            @if (Auth::guest())
                <li><a href="{{ route('login') }}">Login</a></li>
                <li><a href="{{ route('register') }}">Register</a></li>
            @else
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        {{ Auth::user()->name }} <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                         document.getElementById('logout-form').submit();">
                                Logout
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                {{ csrf_field() }}
                            </form>
                        </li>
                    </ul>
                </li>
            @endif
        </ul>
      </div>
    </nav>
  </header>
    <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li>
          <a href="{{route('projects')}}">
            <i class="fa fa-th"></i> <span>Projects</span>
          </a>
        </li>
        <li>
          <a href="{{route('timesheets.create')}}">
            <i class="fa fa-th"></i> <span>Timesheets</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-group"></i>
            <span>Member</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-user-secret"></i>
            <span>Customer</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
    </aside>
    <div class="content-wrapper">
        <section class="content">
            @yield('content')
        </section>
    </div>
    <!-- Scripts -->
    <script src="{{asset('js/jquery.min.js')}}"></script>
    <!-- jQuery UI 1.11.4 -->
    {{-- <script src="{{asset('js/jquery-ui.min.js')}}"></script> --}}
    <script src="{{asset('js/bootstrap.min.js')}}"></script>
    <!-- Morris.js charts -->
    {{-- <script src="{{asset('js/raphael.min.js')}}"></script> --}}
    {{-- <script src="{{asset('js/morris.min.js')}}"></script> --}}
    <!-- Sparkline -->
    {{-- <script src="{{asset('js/jquery.sparkline.min.js')}}"></script> --}}
    <!-- jvectormap -->
    {{-- <script src="{{asset('js/jquery-jvectormap-1.2.2.min.js')}}"></script> --}}
    {{-- <script src="{{asset('js/jquery-jvectormap-world-mill-en.js')}}"></script> --}}
    <!-- jQuery Knob Chart -->
    {{-- <script src="{{asset('js/jquery.knob.min.js')}}"></script> --}}
    <!-- daterangepicker -->
    {{-- <script src="{{asset('js/moment.min.js')}}"></script> --}}
    {{-- <script src="{{asset('js/daterangepicker.js')}}"></script> --}}
    <!-- datepicker -->
    {{-- <script src="{{asset('js/bootstrap-datepicker.min.js')}}"></script> --}}
    <!-- Bootstrap WYSIHTML5 -->
    {{-- <script src="{{asset('js/bootstrap3-wysihtml5.all.min.js')}}"></script> --}}
    <!-- Slimscroll -->
    <script src="{{asset('js/jquery.slimscroll.min.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{asset('js/adminlte.min.js')}}"></script>
    {{-- <script src="{{ asset('js/app.js') }}"></script> --}}
    @yield('script')
</body>
</html>
