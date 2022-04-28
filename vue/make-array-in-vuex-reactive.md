# Make Array in Vuex Reactive

A lot of guides (as of 2022) still focus on Vue2, instead of Vue3, and suggest
using the pattern `Vue.set(object, attribute, value)` to ensure reactivity.

In Vue3, try this instead, `this.$set(object, attribute, value)`.

Here's an example:

```js
import api from '@/common/api'

const state = {
  tasksByListId: [],
};
    
const mutations = {
  SET_TASKS_BY_LIST_ID (state, payload) {
    this.$set(state, 'tasksByListId', payload) // <-- this
  },
};

const actions = {
  getTasksByListId({ commit }, payload) {
    api.getTasks(payload)
      .then(resp => {
        commit('SET_TASKS_BY_LIST_ID', resp.data.filter(item => item.list_id == payload))
      })
      .catch(err => {
        console.log(err)
      })
  },
};

const getters = {
  getTasksByListId (state) {
    return state.tasksByListId
  },
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
```