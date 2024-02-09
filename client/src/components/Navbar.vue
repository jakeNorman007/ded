<script setup>
import Plus from "../icons/Plus.vue";
import HamburgerButton from "../icons/HamburgerButton.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const boardNames = ref([]);
const title = ref("");

onMounted(async () => {
    const response = await axios
        .get("http://localhost:3000/boards/")
        .then((res) => res.data)
        .catch((err) => console.log(err));

    const boards = response.map((item) => ({ id: item.id, title: item.title}));
    boardNames.value = boards;
});

const onSubmit = async () => {
    const response = await axios
        .post("http://localhost:3000/boards/", { title: title.value })
        .then((res) => res.data)
        .catch((err) => console.log(err));

    boardNames.value.push({
        title: response.title,
    })
}
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
            <!-- <input type="text" v-model="title" class="border border-black"/> -->
            <button @click="onSubmit" class="flex gap-2 items-center bg-green-300 w-21 px-6 py-3 mt-6 rounded
                border-t-2 border-green-400">
                <p>New board</p>
                <Plus />
            </button>
            <div class="mt-10">
                <ul v-for="(item, index) in boardNames" :key="index">
                    <button @click="$router.replace(`/boards/${item.id}`) class="bg-green-300 my-2 px-16 py-2 rounded border-t-2 border-green-400">
                        {{ item.title }}, id:{{ item.id }}
                    </button>
                    </router-link>
                </ul>
            </div>
        </div>
    </div>
</template>
