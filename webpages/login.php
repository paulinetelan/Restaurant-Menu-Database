<?php include('header.php'); ?>

<div class = "jumbotron">
  <h2>Log in</h2>
  <form class="form-horizontal" onsubmit="login(); return false;">
    <div class="form-group">
      <label for="username" class="col-sm-2 control-label">Username</label>
      <div class="col-sm-10">
        <input type = "text" id = "username" placeholder = "Username" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="password" class="col-sm-2 control-label">Password</label>
      <div class="col-sm-10">
        <input type = "password" id = "password" placeholder = "Password" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type = "checkbox" id = "adminflag" value = "Admin"> Admin?</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type = "submit" class="btn btn-primary">Log in</button>
        <a href = "addCustomer.php" role="button" class="btn btn-default">Sign up</a>
      </div>
    </div>
  </form>
</div>

<?php include('footer.php'); ?>
