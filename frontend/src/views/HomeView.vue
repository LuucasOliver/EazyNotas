<template>
  <main class="home">
    <div class="
      d-flex
      justify-center
      align-center
      flex-column
    ">
      <img src="@images/welcome.svg" alt="">
      <H1>Bem vindo ao EAZY notas</H1>
    </div>
    <div class="footer">
      <div class="placeholder"></div>
      <div class="subtitle">
        <i>Made with ❤️ and Vue.Js</i>
      </div>
    </div>
  </main>
</template>

<style lang="scss" scoped>
  .home {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    .footer {
      width: 100%;
      display: flex;
      justify-content: space-between;
    }
  }
</style>
