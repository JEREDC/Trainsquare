import axios from 'axios';
import { API_HOST_PREFIX, onGlobalSuccess, onGlobalError } from './serviceHelpers';
// import debug from 'sabio-degug';

// const _logger = debug.extend('workShopService');

const addFavorite = (payload) => {
    const config = {
        method: 'POST',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops`,
        data: payload,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const getUserFavoriteWorkshops = (pageIndex, pageSize) => {
    const config = {
        method: 'GET',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops/current?pageIndex=${pageIndex}&pageSize=${pageSize}`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const getAllFavoriteWorkshops = (pageIndex, pageSize) => {
    const config = {
        method: 'GET',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops/topFavorited?pageIndex=${pageIndex}&pageSize=${pageSize}`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const search = (pageIndex, pageSize, query) => {
    const config = {
        method: 'GET',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops/search?pageIndex=${pageIndex}&pageSize=${pageSize}&query=${query}`,
        crossdomain: true,
        withCredentials: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess);
};

const getFavoriteWorkshopIds = () => {
    const config = {
        method: 'GET',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops/favoriteWorkShopIds`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const deleteFavorite = (id) => {
    const config = {
        method: 'DELETE',
        url: `${API_HOST_PREFIX}/api/favoriteWorkshops/${id}`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

export {
    addFavorite,
    getUserFavoriteWorkshops,
    getFavoriteWorkshopIds,
    deleteFavorite,
    getAllFavoriteWorkshops,
    search,
};
