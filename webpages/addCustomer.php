<?php include('header.php'); ?>

<script>
// Execute this function when page is ready
// See http://api.jquery.com/ready/
$(loadBranchlist_addCustomer);
</script>

<div class = "jumbotron">
  <h2>Registration</h2>
  <form class="form-horizontal" onsubmit="addCustomer(); return false;">
    <div class="form-group">
      <label for="fname" class="col-sm-4 control-label">First name</label>
      <div class="col-sm-8">
        <input type = "text" id = "fname" placeholder = "First name" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="lname" class="col-sm-4 control-label">Last name</label>
      <div class="col-sm-8">
        <input type = "text" id = "lname" placeholder = "Last name" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="username" class="col-sm-4 control-label">Username</label>
      <div class="col-sm-8">
        <input type = "text" id = "username" placeholder = "Username" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="password" class="col-sm-4 control-label">Password</label>
      <div class="col-sm-8">
        <input type = "password" id = "password" placeholder = "Password" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="email" class="col-sm-4 control-label">Email</label>
      <div class="col-sm-8">
        <input type = "text" id = "email" placeholder = "Email" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="branchlist" class="col-sm-4 control-label">Pick a Branch (preferrably the one closest to you)</label>
      <div class="col-sm-8">
        <select id = "branchlist" class="form-control">
          <!-- Populated by loadBranchlist_addCustomer() method -->
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-8">
        <button type = "submit" class="btn btn-primary">Register!</button>
      </div>
    </div>
  </form>
</div>

<?php include('footer.php'); ?>
