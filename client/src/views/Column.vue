<script setup>
import axios from "axios";
import { ref, onMounted } from "vue";

const columnItems = ref([]);
const body = ref("");

onMounted(async () => {
  const response = await axios
    .get("http://localhost:3000/columns")
    .then((res) => res.data)
    .catch((err) => console.error(err));

  const columns = response.map((item) => ({ id: item.id, title: item.title, board_id: item.board_id }));
  columnItems.value = columns;
});
</script>

<template>
    <h1>Columns?</h1>
    <ul v-for="(item, index) in columnItems" :key="index">
        {{ item.title }}
    </ul>
</template>
