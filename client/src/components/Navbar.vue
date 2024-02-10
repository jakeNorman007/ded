<script setup>
import HamburgerButton from "../icons/HamburgerButton.vue";
</script>

<template>
    <div class="sticky p-4 shadow-lg shadow-slate-200">
        <!-- responsive design stuff -->
        <div class="flex items-center justify-between">
            <p class="md:hidden text-2xl font-semibold">Deskbink.</p>
            <button class="md:hidden hover:bg-green-300 rounded p-1"><HamburgerButton /></button>
        </div>
        <!-- end responsive design stuff -->

        <div class="flex-col hidden md:flex">
            <p class="text-2xl font-semibold">Deskbink.</p>
        </div>
    </div>
</template>
