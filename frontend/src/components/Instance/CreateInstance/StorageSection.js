import { MenuItem, Select } from "@mui/material";
import styled from "styled-components";

const StorageSection = ({setData, data}) => {
  const storageHandler = (event) => {
    setData({...data, storage: event.target.value});
  };
    return (
        <Storage>
            <Title>스토리지 구성</Title>
            <Select label="storage" onChange={storageHandler} defaultValue={data.storage} size='small'>
                <MenuItem value='1'>1GB</MenuItem>
                <MenuItem value='2'>2GB</MenuItem>
                <MenuItem value='4'>4GB</MenuItem>
                <MenuItem value='8'>8GB</MenuItem>
                <MenuItem value='16'>16GB</MenuItem>
                <MenuItem value='32'>32GB</MenuItem>
            </Select>
        </Storage>
    );
};

export default StorageSection;

const Storage = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 40%;
  min-width: 400px;
  padding: 2%;
  margin-bottom: 5%;
  box-shadow: 2px 2px #dbdfe0;
  background-color: #fafafa;
`;

const Title = styled.div`
  margin-bottom: 5%;
  font-weight: 600;
`;