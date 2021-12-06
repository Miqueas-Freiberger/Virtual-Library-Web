<?php

class APIView{
    public function response ($data, $status=200)
    {
        header("Content-Type:application/json");
        header("HTTPS/1.1 " . $status . " " . $this->requestStatus($status));
        echo json_encode($data);
    }

    private function requestStatus($code)
    {
        $status = array(
            200 => "OK",
            404 => "Not found",
            500 => "Internal Server Error"
          );
          return (isset($status[$code]))? $status[$code] : $status[500];
    }
}