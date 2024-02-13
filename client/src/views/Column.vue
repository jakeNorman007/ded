<script setup>
import axios from "axios";
import { ref, onMounted } from "vue";

const columnItems = ref([]);
const body = ref("");

onMounted(async () => {
  const response = await axios
    .get("http://localhost:3000/columns/")
    .then((res) => res.data)
    .catch((err) => console.error(err));

  const columns = response.map((item) => ({ id: item.id, title: item.title, board_id: item.board_id }));
  columnItems.value = columns;
});

const createList = async () => {
  const response = await axios
    .post("http://localhost:3000/columns/", { title: body.value })
    .then((res) => res.data)
    .catch((err) => console.error(err));

  columnItems.value.push({
    title: response.body,
  });

};
</script>

<template>
    <div>
        <label for="new_column">Column name:</label>
        <input v-model="body" id="new_column" type="text" class="md:border md:border-black" />
        <button @click="createList">Add column.</button>
    </div>
    <div class="h-screen">
        <ul v-for="(item, index) in columnItems" :key="index">
            <li>{{ item }}</li>
        </ul>
    </div>
</template>
