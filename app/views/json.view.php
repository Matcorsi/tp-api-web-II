<?php

    class JSONView {
        public function response($data, $status = 200) {
            // Verificar si hay datos en la variable $data
            if (empty($data)) {
                $data = ['message' => 'No data found'];  // Puedes enviar un mensaje por defecto si no hay datos.
            }
        
            header("Content-Type: application/json");
            $statusText = $this->_requestStatus($status);
            header("HTTP/1.1 $status $statusText");
        
            echo json_encode($data);  // Retorna los datos como JSON
        }
        

        private function _requestStatus($code) {
            $status = array(
                200 => "OK",
                201 => "Created",
                204 => "No Content",
                400 => "Bad Request",
                401 => "Unauthorized",
                404 => "Not Found",
                500 => "Internal Server Error"
            );
            if(!isset($status[$code])) {
                $code = 500;
            }
            return $status[$code];
        }
    }
