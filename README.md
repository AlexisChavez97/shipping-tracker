# README

To setup project:

bundle install

bin/rails db:create

bin/rails s

## Obtener el estado de un envío

Para consultar el estado de un envío será necesario mandar los siguientes parámetros a la url /trackers

**service**: Indica el servicio de paquetería del envío que se desea consultar.
> Ejemplo: fedex

Con este parámetro se inicializa la clase adecuada encargada de consultar el estado, en este caso sería **Fedex**. Cada servicio de paquetería tiene su propia clase encargada de rastrear envíos.

**tracking_number** Indica el número de rastreo del envío que se desea consultar
>Ejemplo: 1234567890123456

La aplicación se encargará de ir a consultar el estado con el servicio y número proporcionado y regresar el estado actual

**CREATED** El envío fue creado

**ON_TRANSIT** El envío está en camino

**DELIVERED** El envío fue entregado

**EXCEPTION** Hubo un error y no se pudo procesar la solicitud

Estos estados son tomados del archivo de configuración **shipping_services.yml** donde también pueden ser editados 
