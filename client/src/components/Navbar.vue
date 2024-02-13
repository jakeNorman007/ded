<script setup>
import axios from "axios";
import { ref, onMounted } from "vue";
import HamburgerButton from "../icons/HamburgerButton.vue";

const boardNames = ref([]);

onMounted(async () => {
    const response = await axios
        .get("http://localhost:3000/boards/")
        .then((res) => res.data)
        .catch((err) => console.log(err));

    const boards = response.map((item) => ({ id: item.id, title: item.title }));
    boardNames.value = boards;
});
</script>

<template>
    <div class="sticky bg-green-200">
        <!-- responsive design stuff -->
        <div class="flex items-center justify-between">
            <p class="md:hidden text-2xl font-semibold">Deskbink.</p>
            <button class="md:hidden hover:bg-green-300 rounded p-1"><HamburgerButton /></button>
        </div>
        <!-- end responsive design stuff -->

        <div class="hidden md:flex md:pt-4 md:gap-[4rem] md:items-center md:pb-2">
            <p class="text-2xl font-semibold">Deskbink.</p>
            <div class="flex-col hidden md:flex">
                <div class="md:flex md:gap-4">
                    <ul v-for="(item, index) in boardNames" :key="index">
                        <button>
                            {{ item }}
                        </button>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>



