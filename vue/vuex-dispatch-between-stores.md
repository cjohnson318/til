# Vuex: Dispatch Between Stores

Instead of writing `this.$store.dispatch('otherStore/action', payload)`,

```javascript
const state = {
  thing: null,
};
    
const mutations = {
  SET_THING (state, payload) {
    state.thing = {...payload}
  },
};

const actions = {
  updateThing ({ commit, dispatch }, payload) {
    commit('SET_THING', payload)
    dispatch('otherStore/action', payload, {root: true})
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}
```