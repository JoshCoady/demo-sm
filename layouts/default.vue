<template>
  <div>
    <div class="ui fixed inverted menu">
      <div class="ui container">
        <a
          href="#"
          class="header item"
        >
          <img
            class="logo"
            src="~assets/logo.png"
          >
          Staff Manager
        </a>
        <nuxt-link
          class="item"
          to="/"
          exact
        >Home</nuxt-link>
        <nuxt-link
          class="item"
          to="/users"
        >Users</nuxt-link>
      </div>
    </div>
    <nuxt/>
  </div>
</template>

<style>
body {
  background-color: #ffffff;
}
.ui.menu .item img.logo {
  margin-right: 1.5em;
}
.main.container {
  margin-top: 7em;
}
</style>
