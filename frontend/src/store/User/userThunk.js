import { useApiUsers } from "../../hooks/Users/useUserApi";
import { showErrorMessage } from "../../utils/messages";
import { setLoading, setUserAsLogged } from "../Global";

const { logInEndpoint } = useApiUsers();

export const starLogInUser = (user) => {
  return async (dispatch) => {
    const res = await logInEndpoint(user);
    if (res.status === 200) {
      const { data } = res;
      dispatch(setUserAsLogged(data.data));
      dispatch(setLoading(false));
      return;
    }

    showErrorMessage(res.response.data.data);

    // console.log(res.data.data);
  };
};
