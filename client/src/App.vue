<script setup>
import Navbar from "./components/Navbar.vue";
</script>

<template>
    <div class="h-screen md:flex md:flex-col-2">
        <Navbar />
        <router-view />
    </div>
</template>

