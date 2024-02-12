<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

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
    <div class="flex-col hidden md:flex">
        <p class="text-2xl font-semibold">Deskbink.</p>
        <div class="mt-10">
            <ul v-for="(item, index) in boardNames" :key="index">
                <li>
                    {{ item.title }}
                </li>
            </ul>
        </div>
        <router-view />
    </div>
</template>
