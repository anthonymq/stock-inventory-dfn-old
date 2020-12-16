<script>
  import stock from "ic:canisters/stock";
  import { onMount } from "svelte";
  import {
    Collapse,
    Container,
    Nav,
    Navbar,
    NavbarBrand,
    NavbarToggler,
    NavItem,
    NavLink,
  } from "sveltestrap";
  import { Link, Route, Router, navigateTo } from "yrv";

  Router.hashchange = true;
  let isOpen = false;
  let userRole = "";

  function handleUpdate(event) {
    isOpen = event.detail.isOpen;
  }

  async function getUserRole() {
    stock.my_role().then((resp) => {
      console.log(resp);
      if (resp && resp[0]) {
        if ("authorized" in resp[0]) {
          userRole = "Authorized";
        } else if ("admin" in resp[0]) {
          userRole = "Admin";
        } else if ("owner" in resp[0]) {
          userRole = "Owner";
        }
      } else {
        userRole = "Anonyme";
      }
    });
  }

  onMount(() => {
    getUserRole();
    const interval = setInterval(() => {
      getUserRole();
    }, 5000);

    return () => {
      clearInterval(interval);
    };
  });
</script>

<style>
  h1 {
    color: purple;
  }
</style>

<head>
  <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<Navbar color="light" light expand="md">
  <NavbarBrand href="/">Stock-Inventory</NavbarBrand>
  <NavbarToggler on:click={() => (isOpen = !isOpen)} />
  <Collapse {isOpen} navbar expand="md" on:update={handleUpdate}>
    <Nav class="ml-auto" navbar>
      <NavItem>
        <NavLink on:click={() => navigateTo("/")}>Home</NavLink>
      </NavItem>
      <NavItem>
        <NavLink on:click={() => navigateTo("/register")}>Registration</NavLink>
      </NavItem>
      <NavItem><span class="navbar-text"> {userRole} </span></NavItem>
    </Nav>
  </Collapse>
</Navbar>

<Container>
  <Router>
    <Route exact path="/" component={() => import('./Home.svelte')} />
    <Route
      exact
      path="/register"
      component={() => import('./players/Register.svelte')} />
    <Route
      exact
      path="/list"
      component={() => import('./players/RecentPlayers.svelte')} />
    <Route
      exact
      path="/board"
      component={() => import('./game/Board.svelte')} />
  </Router>
</Container>
