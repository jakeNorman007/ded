import { createRouter, createWebHistory } from "vue-router";

const routes = [
    { 
        path: "/",
        name: "Board",
        component: () => import("../views/Board.vue"), 
        children: [
            {
                path: "/",
                component: () => import("../views/Column.vue"),
            },
        ],
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
