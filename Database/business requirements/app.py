from flask import Flask, render_template, request, redirect, url_for, jsonify
from dataclasses import dataclass, asdict
import json
import os

app = Flask(__name__)  


@dataclass
class Customer:
    name: str
    date_of_registration: str
    address: str
    city: str
    pin: str
    phone: str
    email: str

@dataclass
class Order:
    customer_id: str
    order_date: str
    recipient_name: str
    recipient_address: str
    recipient_city: str
    weight: float
    description: str

@dataclass
class Distribution:
    distribution_date: str

@dataclass
class Delivery:
    employee_id: str
    order_id: str
    delivery_date: str
    status: str
    remarks: str

@dataclass
class Invoice:
    customer_id: str
    invoice_month: int
    invoice_year: int
    description: str


class Storage:
    def __init__(self, filename):
        self.filename = filename
        self.data = self._load()

    def _load(self):
        if os.path.exists(self.filename):
            with open(self.filename, 'r') as f:
                return json.load(f)
        return []

    def save(self, entry):
        self.data.append(entry)
        with open(self.filename, 'w') as f:
            json.dump(self.data, f, indent=4)

    def get_all(self):
        return self.data

    def get_by_filter(self, key, value):
        return [item for item in self.data if item.get(key) == value]


class SterlingDAO:
    def __init__(self):
        self.customer_store = Storage("customers.json")
        self.order_store = Storage("orders.json")
        self.distribution_store = Storage("distributions.json")
        self.delivery_store = Storage("deliveries.json")
        self.invoice_store = Storage("invoices.json")

    def saveCustomer(self, customer: Customer):
        self.customer_store.save(asdict(customer))

    def saveOrder(self, order: Order):
        self.order_store.save(asdict(order))

    def saveDistribution(self, distribution: Distribution):
        self.distribution_store.save(asdict(distribution))

    def saveDelivery(self, delivery: Delivery):
        self.delivery_store.save(asdict(delivery))

    def saveInvoice(self, invoice: Invoice):
        self.invoice_store.save(asdict(invoice))

    def listCustomers(self):
        return self.customer_store.get_all()

    def listOrders(self):
        return self.order_store.get_all()

    def listDeliveries(self):
        return self.delivery_store.get_all()

    def listInvoices(self):
        return self.invoice_store.get_all()

    def getOrdersByCustomer(self, customer_id):
        return self.order_store.get_by_filter("customer_id", customer_id)



dao = SterlingDAO()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register_customer', methods=['GET', 'POST'])
def register_customer():
    if request.method == 'POST':
        data = request.form
        customer = Customer(
            name=data['name'],
            date_of_registration=data['date_of_registration'],
            address=data['address'],
            city=data['city'],
            pin=data['pin'],
            phone=data['phone'],
            email=data['email']
        )
        dao.saveCustomer(customer)
        return redirect(url_for('list_customers'))
    return render_template('register_customer.html')

@app.route('/book_order', methods=['GET', 'POST'])
def book_order():
    if request.method == 'POST':
        data = request.form
        order = Order(
            customer_id=data['customer_id'],
            order_date=data['order_date'],
            recipient_name=data['recipient_name'],
            recipient_address=data['recipient_address'],
            recipient_city=data['recipient_city'],
            weight=float(data['weight']),
            description=data['description']
        )
        dao.saveOrder(order)
        return redirect(url_for('list_orders'))
    return render_template('book_order.html')

@app.route('/generate_distribution', methods=['GET', 'POST'])
def generate_distribution():
    if request.method == 'POST':
        date = request.form['distribution_date']
        dao.saveDistribution(Distribution(distribution_date=date))
        return redirect(url_for('index'))
    return render_template('generate_distribution.html')

@app.route('/record_delivery', methods=['GET', 'POST'])
def record_delivery():
    if request.method == 'POST':
        data = request.form
        delivery = Delivery(
            employee_id=data['employee_id'],
            order_id=data['order_id'],
            delivery_date=data['delivery_date'],
            status=data['status'],
            remarks=data['remarks']
        )
        dao.saveDelivery(delivery)
        return redirect(url_for('list_deliveries'))
    return render_template('record_delivery.html')

@app.route('/generate_invoice', methods=['GET', 'POST'])
def generate_invoice():
    if request.method == 'POST':
        data = request.form
        invoice = Invoice(
            customer_id=data['customer_id'],
            invoice_month=int(data['invoice_month']),
            invoice_year=int(data['invoice_year']),
            description=data['description']
        )
        dao.saveInvoice(invoice)
        return redirect(url_for('list_invoices'))
    return render_template('generate_invoice.html')



@app.route('/list_customers')
def list_customers():
    return render_template('list_customers.html', customers=dao.listCustomers())

@app.route('/list_orders')
def list_orders():
    return render_template('list_orders.html', orders=dao.listOrders())

@app.route('/list_deliveries')
def list_deliveries():
    return render_template('list_deliveries.html', deliveries=dao.listDeliveries())

@app.route('/list_invoices')
def list_invoices():
    return render_template('list_invoices.html', invoices=dao.listInvoices())

@app.route('/customer_orders/<customer_id>')
def customer_orders(customer_id):
    orders = dao.getOrdersByCustomer(customer_id)
    return jsonify(orders)

if __name__ == '__main__':  
    app.run(debug=True)
