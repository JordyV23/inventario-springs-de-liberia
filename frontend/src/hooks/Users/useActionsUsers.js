import { useDispatch, useSelector } from "react-redux";
import { setLoading } from "../../store";
import { starLogInUser } from "../../store/User/userThunk";

export const useActionsUsers = () => {
  const dispatch = useDispatch();

  const { username, password } = useSelector((state) => state.users);

  const makeLogin = () => {
    dispatch(setLoading(true));
    dispatch(starLogInUser({ username, password }));
  };

  return {
    makeLogin,
  };
};
