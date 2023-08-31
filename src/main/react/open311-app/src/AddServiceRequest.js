import "bootstrap/dist/css/bootstrap.min.css";
import { useState, useEffect } from 'react';
import { Button,Modal,Input } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEye, faPen, faTrash } from '@fortawesome/free-solid-svg-icons'

const iconEye = <FontAwesomeIcon icon={faEye} />
const iconPen = <FontAwesomeIcon icon={faPen} />
const iconTrash = <FontAwesomeIcon icon={faTrash} />

function ServiceRequest() {

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    function handleSubmit(event) {
      event.preventDefault();

    }

    const [services, setServices] = useState([]);

    	useEffect(function() {
    		fetch("/api/v1/services")
    			.then(response => response.json())
    			.then(response => setServices(response))
    			.catch(() => setServices([]));
    	}, []);

  return (
       <div class="container">
          <div className="crud shadow-lg p-3 mb-5 mt-5 bg-body rounded">
          <div>
          <h4><b>Solicitudes de Servicio</b></h4>
          </div>
          <div class="row ">
           <div class="col-sm-3 mt-5 mb-4 text-gred">
              <div className="search">
                <form class="form-inline">
                 <input class="form-control mr-sm-2" type="search" placeholder="Buscar"/>
                </form>
              </div>
              </div>
              <div class="col-sm-3 offset-sm-2 mt-5 mb-4 text-gred" style={{color:"green"}}></div>
              <div class="col-sm-3 offset-sm-1  mt-5 mb-4 text-gred">
              <Button variant="primary" onClick={handleShow}>
                Agregar Solicitud de Servicio
              </Button>
             </div>
           </div>
            <div class="row">
                <div class="table-responsive " >
                 <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th></th>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Dirección</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                      {services.map(service => (
                        <tr>
                          <td>
                            <button class="btn btn-sm btn-block btn-success" title="Ver" >{iconEye}</button>
                            <button class="btn btn-sm btn-block btn-primary" title="Editar" >{iconPen}</button>
                            <button class="btn btn-sm btn-block btn-danger" title="Eliminar" >{iconTrash}</button>
                          </td>
                          <td>
                            {service.service_request_id}
                          </td>
                          <td>
                            {service.first_name}
                          </td>
                          <td>
                            {service.last_name}
                          </td>
                          <td>
                            {service.address_string}
                          </td>
                          <td>
                            {service.email}
                          </td>
                          <td>
                            {service.phone}
                          </td>
                          <td>
                            {service.description}
                          </td>
                          <td>
                            {service.status}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                </table>
            </div>
        </div>

        {/* <!--- Model Box ---> */}
        <div className="model_box">
      <Modal
        show={show}
        onHide={handleClose}
        backdrop="static"
        keyboard={false}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title>Solicitud de Servicio</Modal.Title>
        </Modal.Header>
            <Modal.Body>
            <form>
                <div class="form-group">
                  <span><b>Nombre:</b></span>
                  <input type="text" class="form-control" id="first_name" placeholder="Ingresa el Nombre"/>
                </div>
                <div class="form-group">
                  <span><b>Apellido:</b></span>
                  <input type="text" class="form-control" id="last_name" placeholder="Ingresa el Apellido"/>
                </div>
                <div class="form-group">
                <span><b>Dirección:</b></span>
                    <input type="text" class="form-control" id="address_string" placeholder="Ingresa la Dirección (calle y número, colonia, cp)"/>
                </div>
                <div class="form-group">
                <span><b>Email:</b></span>
                    <input type="text" class="form-control" id="email" placeholder="Ingresa el Email"/>
                </div>
                <div class="form-group">
                <span><b>Teléfono:</b></span>
                    <input type="text" class="form-control" id="phone" placeholder="Ingresa el Teléfono"/>
                </div>
                <div class="form-group">
                <span><b>Descripción:</b></span>
                  <textarea class="form-control" id="description" rows="3"/>
                </div>
                </form>
            </Modal.Body>

            <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Cancelar
          </Button>
          <Button variant="primary" onClick={handleClose}>
            Guardar
          </Button>
        </Modal.Footer>
      </Modal>

       {/* Model Box Finsihs */}
       </div>
      </div>
      </div>
  );
}

export default ServiceRequest;
